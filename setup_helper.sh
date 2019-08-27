findTagValueInFile(){
    local _tag=$1;
    local _file=$2;

    local _tag_find="sed -n -e 's/^.*${_tag}//p' ${_file}";
    local _tag_value=$(eval $_tag_find);
    _tag_value=${_tag_value//[\"\,]/""};
    _tag_value=$(echo $_tag_value | sed -e 's/^[[:space:]]*//');
    echo "$_tag_value";
}

findTagValueInCommandOutput(){
    local _tag=$1;
    local _command_string=$2;
    local _no_label_in_command=$3;

    local _tag_for_sed=${_tag//[\/]/"\\/"};

    local _tag_find="${_command_string}";
    if [ -z "${_no_label_in_command}" ]; then
      _tag_find="${_command_string} | sed -n -e 's/^.*${_tag_for_sed}//p'";
    fi

    local _tag_value=$(eval $_tag_find);
    _tag_value=$(echo $_tag_value | cut -d $'\t' -f 1);
    _tag_value=$(echo $_tag_value | cut -d ' ' -f 1);
    _tag_value=${_tag_value//[\"\,]/""};
    _tag_value=$(echo $_tag_value | sed -e 's/^[[:space:]]*//');
    echo "$_tag_value";
}

installNpmModuleIfNeeded(){
    local _module_label=$1;
    local _file_containing_targets=$2;
    local _command_listing_current=$3;
    local _no_label_in_command=$4;

    _module_label_for_tag=${_module_label//[\/]/"\\/"};

    local _tag="\"${_module_label_for_tag}\": \"";
    local _target_version=$(findTagValueInFile "$_tag" "$_file_containing_targets");
    local _current_version=$(findTagValueInCommandOutput "$_module_label" "$_command_listing_current" "$_no_label_in_command");

    local _target_compare="${_target_version}";
    local _current_compare="${_current_version}";
    if [[ $_target_version =~ ^\^.* ]]; then
      _target_version="${_target_version:1}";
      _target_compare=$(echo $_target_version | cut -d '.' -f 1);
      _current_compare=$(echo $_current_version | cut -d '.' -f 1);
    elif [[ $_target_version =~ ^\~.* ]]; then
      _target_version="${_target_version:1}";
      _target_compare=$(echo $_target_version | cut -d '.' -f 1,2);
      _current_compare=$(echo $_current_version | cut -d '.' -f 1,2);
    fi

    if [[ "$_current_compare" != "$_target_compare" ]]; then
      eval "npm i -g ${_module_label_for_tag}@'${_target_compare}';";
    fi
}

curl -LJO https://raw.githubusercontent.com/bcgov/eagle-dev-guides/master/shell_helper.sh;
source ./shell_helper.sh;

asdfProfileWriterBrew(){
    local _profile_file=$1;
    if [[ ! -e "$_profile_file" ]]; then
        touch "$_profile_file";
    fi
    if ! grep "/asdf.sh" "$_profile_file"; then
        echo "\n. $(brew --prefix asdf)/asdf.sh" >> "$_profile_file";
    fi
    if ! grep "/asdf.bash" "$_profile_file"; then
        echo "\n. $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash" >> "$_profile_file";
    fi
}

asdfProfileWriterNonBrew(){
    local _profile_file=$1;
    if [[ ! -e "$_profile_file" ]]; then
        touch "$_profile_file";
    fi
    if ! grep "/asdf.sh" "$_profile_file"; then
        echo -e '\n. $HOME/.asdf/asdf.sh' >> "$_profile_file";
    fi
    if ! grep "/asdf.bash" "$_profile_file"; then
        echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> "$_profile_file";
    fi
}

asdfProfileSettings(){
    local _profile_file=$1;
    local _profile_file_before=$(date -r "$_profile_file" "+%m-%d-%Y %H:%M:%S");
    if [[ "$PACKAGE_MANAGER" == "brew" ]]; then
        asdfProfileWriterBrew "$_profile_file";
    else
        asdfProfileWriterNonBrew "$_profile_file";
    fi
    local _profile_file_after=$(date -r "$_profile_file" "+%m-%d-%Y %H:%M:%S");
    if [[ "$_profile_file_before" != "$_profile_file_after" ]]; then source "$_profile_file"; fi
}

envProfileSettings(){
    local _profile_file=$1;
    if [[ ! -e "$_profile_file" ]]; then
        touch "$_profile_file";
    fi
    local _profile_file_before=$(date -r "$_profile_file" "+%m-%d-%Y %H:%M:%S");
    if ! grep "export MONGODB_DATABASE=" "$_profile_file"; then
        echo "export MONGODB_DATABASE=\"epic\"" >> "$_profile_file";
    fi

    if ! grep "export MINIO_HOST=" "$_profile_file"; then
        echo "export MINIO_HOST=\"foo.pathfinder.gov.bc.ca\"" >> "$_profile_file";
    fi

    if ! grep "export MINIO_ACCESS_KEY=" "$_profile_file"; then
        echo "export MINIO_ACCESS_KEY=\"xxxx\"" >> "$_profile_file"
    fi

    if ! grep "export MINIO_SECRET_KEY=" "$_profile_file"; then
        echo "export MINIO_SECRET_KEY=\"xxxx\"" >> "$_profile_file";
    fi

    if ! grep "export KEYCLOAK_ENABLED=" "$_profile_file"; then
        echo "export KEYCLOAK_ENABLED=\"true\"" >> "$_profile_file";
    fi
    local _profile_file_after=$(date -r "$_profile_file" "+%m-%d-%Y %H:%M:%S");
    if [[ "$_profile_file_before" != "$_profile_file_after" ]]; then source "$_profile_file"; fi
}

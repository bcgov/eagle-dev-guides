ate;
    sudo apt-get -y install build-essential coreutils automake autoconf openssl libtool unixodbc unzip curl git mongodb make jq;
    # OpenShift client install
    curl -LO https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
    tar zxvf openshift-origin-client-tools*
    sudo mv openshift-origin-client-tools*/oc /usr/local/bin/
    rm -rf openshift-origin-client-tools*

else
    echo -e \\n"Packages not installed.\\n"\\n
    exit 1;
fi

curl -LJO https://raw.githubusercontent.com/bcgov/eagle-dev-guides/master/vscodeextensions.txt;
source ./vscodeextensions.txt;

envProfileSettings "${PROFILE_FILE}";
envProfileSettings "${RC_FILE}";

if [[ ! -d ~/.asdf ]]; then
    if [[ "$PACKAGE_MANAGER" == "brew" ]]; then
        brew install asdf;
        asdfProfileSettings "${PROFILE_FILE}";
        asdfProfileSettings "${RC_FILE}";
        brew upgrade asdf;
        chmod +x /usr/local/opt/asdf/asdf.sh;
        chmod +x /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash;
    else
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf;
        cd ~/.asdf;
        git checkout "$(git describe --abbrev=0 --tags)";
        asdfProfileSettings "${PROFILE_FILE}";
        asdfProfileSettings "${RC_FILE}";
        asdf update;
    fi
else
    asdfProfileSettings "${PROFILE_FILE}";
    asdfProfileSettings "${RC_FILE}";
fi

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git;
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring;
asdf plugin-add yarn https://github.com/twuni/asdf-yarn.git;
asdf plugin-add java;
asdf plugin-add gradle https://github.com/rfrancis/asdf-gradle;

echo "Finished installing developer prerequisites";

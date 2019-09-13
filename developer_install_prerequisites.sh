source ./developer_install_helper.sh

PACKAGE_MANAGER=""

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    PACKAGE_MANAGER="brew";
elif [[ "$OSTYPE" == "cygwin"* || "$OSTYPE" == "msys"* || "$OSTYPE" == "win"* ]]; then
    # POSIX compatibility layer and Linux environment emulation for Windows
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
    PACKAGE_MANAGER="choco";
elif [[ "$OSTYPE" == "linux"* ]]; then
    if grep -qi Microsoft /proc/sys/kernel/osrelease 2> /dev/null; then
        # Win10 bash
        PACKAGE_MANAGER="choco";
    else
        # Linux
        DISTRO=$(lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om);
        if [[ "$DISTRO" == *"hat"* || "$DISTRO" == *"centos"* ]]; then
            PACKAGE_MANAGER="yum";
        elif [[ "$OSTYPE" == *"debian"* || "$OSTYPE" == *"ubuntu"* ]]; then
            PACKAGE_MANAGER="apt";
        fi
    fi
elif [[ "$OSTYPE" == "bsd"* || "$OSTYPE" == "solaris"* ]]; then
    # not supported
    echo -e \\n"OS not supported. Supported OS:\\nMac OSX\\nWindows\\nDebian\\nFedora\\n"\\n
    exit 1
else
    echo -e \\n"OS not detected. Supported OS:\\nMac OSX\\nWindows\\nDebian\\nFedora\\n"\\n
    exit 1
fi


if [[ "$PACKAGE_MANAGER" == "brew" ]]; then
    which -s brew;
    if [[ $? != 0 ]] ; then
        # Install Homebrew
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
    fi
    brew update;
    brew install coreutils automake autoconf openssl \
    libyaml readline libxslt libtool unixodbc \
    unzip curl \
    git mongodb make;
    brew cask install visual-studio-code;
elif [[ "$PACKAGE_MANAGER" == "choco" ]]; then
    sudo PowerShell -NoProfile -ExecutionPolicy remotesigned -Command ". 'install_choco.ps1;"
    choco upgrade chocolatey;
    choco install git vscode make -y;
elif [[ "$PACKAGE_MANAGER" == "yum" ]]; then
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc;
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo';
    yum check-update;
    sudo yum -y install git code make;
elif [[ "$PACKAGE_MANAGER" == "apt" ]]; then
    sudo apt-get update && sudo apt-get -y upgrade;
    ccurl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg;
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/;
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list';
    sudo apt-get install apt-transport-https;
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10;
    echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list;
    sudo apt-get update;
    sudo apt-get -y install build-essential git-core mongodb-org code;
else
    echo -e \\n"Packages not installed.\\n"\\n
    exit 1
fi

source ./vscodeextensions.txt

envProfileSettings ~/.bash_profile;
envProfileSettings ~/.bashrc;

if [[ ! -d ~/.asdf ]]
then
    if [[ "$PACKAGE_MANAGER" == "brew" ]]; then
        brew install asdf;
        asdfProfileSettings ~/.bash_profile;
        asdfProfileSettings ~/.bashrc;
        brew upgrade asdf;
    else
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf;
        cd ~/.asdf;
        git checkout "$(git describe --abbrev=0 --tags)";
        asdfProfileSettings ~/.bash_profile;
        asdfProfileSettings ~/.bashrc;
        asdf update;
    fi
else
    asdfProfileSettings ~/.bash_profile;
    asdfProfileSettings ~/.bashrc;
fi

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git;
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring;
asdf plugin-add yarn https://github.com/twuni/asdf-yarn.git;
asdf plugin-add java;
asdf plugin-add gradle https://github.com/rfrancis/asdf-gradle;

echo "Finished installing developer prerequisites"

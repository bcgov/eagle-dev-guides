source ./setup_helper.sh;

checkDependencies;
cleanModules;
installNodeIfNeeded;
installJavaIfNeeded;
installGradleIfNeeded;

# TODO: waiting for asdf bugfix to handle yarn installs gracefully
# npm i -g yarn@1.10.1;
# yarn install;
source ~/.bashrc;
source ~/.bash_profile;

npm i;

npm ls -g --depth=0;

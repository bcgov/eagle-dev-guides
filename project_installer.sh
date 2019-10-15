curl -LJO https://raw.githubusercontent.com/bcgov/eagle-dev-guides/master/setup_helper.sh;
source ./setup_helper.sh;

checkDependencies;
cleanModules;
installNodeIfNeeded;
installJavaIfNeeded;
installGradleIfNeeded;

# TODO: waiting for asdf bugfix to handle yarn installs gracefully
# npm i -g yarn@1.10.1;
# yarn install;

source "${PROFILE_FILE}";
source "${RC_FILE}";

npm i;

npm ls -g --depth=0;

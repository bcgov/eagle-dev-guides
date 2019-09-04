source ./setup_helper.sh;

if [[ ! -d ~/.asdf ]]
then
    echo -e \\n"Prerequisites not installed.\\nPlease run the prerequisites script here: https://github.com/bcgov/eagle-dev-guides/blob/master/dev_guides/node_npm_requirements.md\\n"\\n;
    exit 1;
fi

if [[ ! -e .tool-versions ]]
then
    echo -e \\n".tool-versions file not present.\\nPlease run this script in the root folder of the project.\\n"\\n;
    exit 1;
fi

if [[ -e ./node_modules ]]; then rm -Rf ./node_modules; fi
if [[ -e ./*.lock ]]; then rm ./*.lock; fi
mkdir node_modules;

NODEJS_TAG="nodejs ";
NODEJS_TARGET_VERSION=$(findTagValueInFile "$NODEJS_TAG" ".tool-versions");
NODEJS_CURRENT_VERSION=$(findTagValueInCommandOutput "v" "node -v");

if [[ "$NODEJS_CURRENT_VERSION" != "$NODEJS_TARGET_VERSION" ]]; then
  asdf install nodejs $NODEJS_TARGET_VERSION;
  asdf reshim nodejs;
fi

# TODO: waiting for asdf bugfix to handle yarn installs gracefully
# npm i -g yarn@1.10.1;
# yarn install;
source ~/.bashrc;
source ~/.bash_profile;

npm i;

npm ls -g --depth=0;

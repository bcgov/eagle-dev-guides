# Node & NPM Setup

## Pre-requisites

Run the utility file at the root of this repo called 'developer_install_prerequisites.sh'

```
.\developer_install_prerequisites.sh
```

This will take care of installing the basic tools and prerequisites needed for EAO EPIC Eagle
- Make sure to restart your shell before continuing then verify asdf installed
- If it did not install follow manual install instructions at [WindowsReadme.md](https://github.com/bcgov/eagle-dev-guides/blob/master/WindowsReadme.md})

```
asdf install nodejs x.xx.x
```

Then run the following commands every time you need to switch npm versions in a project.

```
asdf reshim nodejs
npm i -g yarn
yarn install
```


## Install [Node.js](https://nodejs.org/)

Includes npm... Just use default settings.

### Verify the Installation

```
npm ls -g --depth=0
```

### Uninstall Older Node (if needed)

1. Uninstall all global packages: `npm uninstall -g <package>`
1. Uninstall Node.js
1. Delete `C:\Users\{user}\AppData\Roaming\npm`
1. Delete `C:\Users\{user}\AppData\Roaming\npm-cache`
1. Delete `C:\Users\{user}\AppData\Local\Temp\npm-*`
1. Reboot
1. Install Node.js 

## Install Packages

1. Install [Angular CLI](https://angular.io/): `npm i -g @angular/cli@6.2.1`
1. Install [Yarn](https://yarnpkg.com/): `npm i -g yarn`
1. Install [TSLint](https://palantir.github.io/tslint/): `npm i -g tslint`
1. Install [TypeScript](https://www.npmjs.com/package/typescript) (needed for Webpack): `npm i -g typescript@'>=2.1.0 <2.4.0'`


## Verify Package Installation

- Angular CLI 6.2.1 (run `npm ls -g @angular/cli --depth=0` to verify)
- Yarn 1.10.1 or greater (run `yarn -v` to verify)
- TSLint 5.11.0 or greater  (run `tslint -v` to verify)
- TypeScript 2.3.4 (for webpack) (run `npm ls -g typescript --depth=0` to verify)

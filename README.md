# eagle-common-components

Common NPM components used by various front-ends

## Setting up

We use a version manager so as to allow concurrent versions of node and other software.  [asdf](https://github.com/asdf-vm/asdf) is recommended.

Run the following commands:

```bash
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf reshim nodejs
npm i -g yarn
yarn install
```

We use a config file for asdf called .tool-versions that the reshim command picks up so that all collaborators are using the same versions.

## Using Common-Components

We want to have one copy of our code so that it is easier to avoid version errors and so that we can test in one place.

We will package up the code in this repo as NPM components and use a service at bit.dev to manage and distribute them via NPM.

### Setting up bit.dev on your machine

Clone your fork of this repository and pull it down to local.

From the command line interface in the root directory of this repo, run the following commands:

```bash

npm install bit-bin -g
bit init
bit add src/components/*
bit import bit.envs/compilers/typescript --compiler
```

### Publishing your changes to NPM

Make some changes to your code and check it following normal test and PR workflows.

You will need to publish it first so your other repo projects can consume it.  

Log in to the <https://bit.dev> website and check the latest tagged version of the component.  In the following command, use the next sequential version number:

```bash

bit tag --all 0.0.2
bit export eao.epic
```

If all goes well you should see output indicating that your code was published to eao.epic.  You can also see the latest version at <https://bit.dev> .

### Consuming the code in your destination projects

In your project that you wish to have make use of the functionality in your common components:

```bash
npm i @bit/eao.epic.comment-period-business-logic
```

And then in your actual js code files,

```javascript
import CommentPeriodBusinessLogic from '@bit/eao.epic.comment-period-business-logic';
```

...and that's it, you should be able to use the common component objects.

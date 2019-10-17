# Windows installation notes

## Must use Windows Subsystem for Linux (WSL)

click [here](https://docs.microsoft.com/en-us/windows/wsl/install-win10) to install WSL

## Installation

- Run the install scripts on whichever repo you are on. Should work if running through wsl.
  - If not update this document so future Windows users have an easier time!
  - MONGODB IS ON V4.0 not V3.4!!!

### Extra Notes / Known Problems

- CHECK YOUR LINE ENDINGS! Use LF not CRLF! Make sure to set this up!
  - This will be where most of your problems are coming from
- Mongodb has problems with WSL. Check [here](https://github.com/Microsoft/WSL/issues/3286) for more information about that
  - If running into problems I found [this](https://github.com/Microsoft/WSL/issues/3286#issuecomment-402594992) answer helped me
  - Also [this](https://github.com/Microsoft/WSL/issues/796#issuecomment-255451470) helped me get it started up as a service
- The functions don't seem to be working for me. So as of right now I have been installing the dependencies manually
- Couldn't use asdf to install java openjdk 11 so just apt-install
- Needed unzip to install gradle using asdf
- Also make sure you set your line endings to lf. Click [here](https://help.github.com/en/articles/configuring-git-to-handle-line-endings) to see how to set that up in git

### If not using wsl
 - The scripts will not work without using wsl, you will need to install the dependecies manually
 - Use chocolately and check the scripts for the proper versions

#################################
## Home specific configuration ##
#################################


## This file should not contain any secrets or sensitive information.
## Any secret data that needs to be synced between computers should
## be accessed using 1password-cli.


# Binary search path setup
set PATH $HOME/bin/android-sdk/platform-tools $PATH

# Platform path setup
set NODE_PATH /usr/local/lib/node_modules:$NODE_PATH
set GOPATH "/Users/htw/w/go"

# machine-specific git configuration
set -gx GIT_AUTHOR_NAME "Harley Watson"
set -gx GIT_AUTHOR_EMAIL "htw@lobi.to"
set -gx GIT_COMMITTER_NAME "$GIT_AUTHOR_NAME"
set -gx GIT_COMMITTER_EMAIL "$GIT_AUTHOR_EMAIL"
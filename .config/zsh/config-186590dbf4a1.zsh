################################
## SKY specific configuration ##
################################


## This file should not contain any secrets or sensitive information.
## Any secret data that needs to be synced between computers should
## be accessed using 1password-cli.


# wrap mshell-aws-login around 1password-cli
function mshell-aws-login-auto() {
    op signin awooo

    password=$(op get item xyhtvegrj5dhnfpdrg7b5myq3y | jq -r '.details.fields[] | select(.designation=="password").value')
    totp=$(op get totp nhvnmjoh3bhkbmyf25yrwzz6tu)

    oldclipboard=$(pbpaste)
    echo $totp | pbcopy
    echo "Placed TOTP token ("$totp") on clipboard"

    mshell-aws-login-adfs --mfa-type totp --username harleywatson --password $password

    source ~/.aws/aws_default_profile

    echo $oldclipboard | pbcopy
    echo "Restored clipboard"
}

alias mshell-aws-login='mshell-aws-login-auto'

# persist mshell-aws-login session
source $HOME/.aws/aws_default_profile

# export NVM_DIR="$HOME/.nvm"
# bass source "/usr/local/opt/nvm/nvm.sh"

# machine-specific git configuration
export GIT_AUTHOR_NAME="Harley Watson"
export GIT_AUTHOR_EMAIL="harley.watson@skyscanner.net"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
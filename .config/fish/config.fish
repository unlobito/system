#######################################
## General macOS shell configuration ##
#######################################


# Binary search path setup
set PATH $HOME/bin $PATH

set -gx MAKEOPTS "-j4"
set -gx EDITOR nano

alias ls "ls -G"
alias nh 'unset HISTFILE'
alias beep 'osascript -e "beep 1"'

alias homegit "git --work-tree=$HOME --git-dir=$HOME/.files.git"

alias qr "qrcode-terminal"

# rbenv/pyenv init
. (rbenv init - | psub)

. (pyenv init - | psub)
. (pyenv virtualenv-init - | psub)


# bobthefish settings
set -g theme_date_format "+%a %H:%M"
set -g theme_color_scheme dark
set -g theme_nerd_fonts yes

# Import environment-specific configuration based on MAC address
set localconfig "$HOME/.config/fish/config-"(ifconfig en0 | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}' | sed 's/://g')

if test -e "$localconfig-secrets.fish"
    # Make secrets available to public config
    . "$localconfig-secrets.fish"
end

if test -e "$localconfig.fish"
    . "$localconfig.fish"
end
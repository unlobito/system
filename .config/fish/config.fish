# Binary search path setup
set PATH /Users/htw/bin /Users/htw/bin/android-sdk/platform-tools $PATH

# Platform path setup
set NODE_PATH /usr/local/lib/node_modules:$NODE_PATH
set GOPATH "/Users/htw/w/go"

set -gx MAKEOPTS "-j4"
set -gx EDITOR nano

alias ls "ls -G"
alias nh 'unset HISTFILE'
alias beep 'osascript -e "beep 1"'

alias homegit "git --work-tree=$HOME --git-dir=$HOME/.files.git"

alias qr "qrcode-terminal"

# rbenv/pyenv init
. (rbenv init - | psub)

set -gx PYENV_ROOT '/Users/htw/.pyenv'
. (pyenv init - | psub)
. (pyenv virtualenv-init - | psub)


# bobthefish settings
set -g theme_date_format "+%a %H:%M"
set -g theme_color_scheme dark
set -g theme_nerd_fonts yes


# Binary search path setup
export PATH=/usr/local/sbin:$PATH
export PATH=~/bin:$PATH
export PATH=~/bin/pebble-dev/PebbleSDK-3.0/bin:$PATH
export PATH=/Applications/MAMP/bin/php/php5.6.2/bin:$PATH
export PATH=/Users/henri/bin/android-sdk/platform-tools:/Users/henri/bin/android-sdk/tools:$PATH

# Platform path setup
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH
export GOPATH="/Users/henri/Code/go"

export MAKEOPTS="-j"
export EDITOR=nano

export TERM="xterm-color"

alias ls="ls -G"
alias nh='unset HISTFILE'
alias beep='osascript -e "beep 1"'

alias homegit="git --work-tree=$HOME --git-dir=$HOME/.files.git"

alias qr="qrcode-terminal"

PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\]:\w\[\033[00m\]$ "

eval "$(rbenv init -)"

eval $(thefuck --alias)

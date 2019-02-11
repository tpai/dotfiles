# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# PS
alias psa="ps aux"
alias psg="ps aux | grep "

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='exa -alg --git'
  alias ls='exa -s ext'
fi

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'

# Git Aliases
alias ga='git add -A'
alias gs='git status'
alias gcm='git commit -m'
alias gl='vim +GV'
alias gv='vim +GV'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gplr='git pull --rebase'
alias gfap='git fetch --all --prune'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gsh='git stash'
alias gshp='git stash pop'
alias gpuo='git push -u origin'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew prune && brew doctor'

# bat
alias oldcat=/bin/cat
alias cat=/usr/local/bin/bat

# fd
alias oldfind=/usr/bin/find
alias find=/usr/local/bin/fd

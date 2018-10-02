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
alias psr='ps aux | grep ruby'

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
  alias ll='ls -alGh'
  alias ls='ls -Gh'
fi

# show me files matching "ls grep"
alias lsg='ll | grep'

# find files by keywords in JS project
alias grepjs='grep --exclude-dir={node_modules,tests,output,www,.git} --include=\*.{js,jsx} -rnw "." -e '

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'

# Git Aliases
alias ga='git add -A'
alias gs='git status'
alias gc='git commit'
alias gl="git log --color --graph --abbrev=8 --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s' --abbrev-commit"
alias gplr='git pull --rebase'
alias gfap='git fetch --all --prune'
alias gri='git rebase --interactive'
alias gsh='git stash'
alias gshp='git stash pop'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew prune && brew doctor'

# bat
alias oldcat=/bin/cat
alias cat=/usr/local/bin/bat

# fd
alias oldfind=/usr/bin/find
alias find=/usr/local/bin/fd

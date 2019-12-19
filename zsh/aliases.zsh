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
alias gl='vim +GV'
alias gv='vim +GV'
alias ga='git add -A'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'              # create branch
alias gco-='git checkout --'              # unchange changed files
alias gcfd='git clean -fd'                # remove untracked files
alias gfp='git fetch --all --prune'       # fetch and prune branch
alias gplr='git pull --rebase'            # pull and ff branch
alias gpu='git push -u'
alias gr='git rebase'
alias gri='git rebase --interactive'      # rebase in interactive mode
alias gr.='git reset .'                   # unstage all
alias grh='git reset --hard'              # force reset
alias gs='git status'
alias gsh='git stash --include-untracked' # stash untracked files
alias gshp='git stash pop'

# Go
alias gor='go run'
alias gob='go build'
alias got='go test'

# Homebrew
alias brewu='brew update && brew upgrade && brew cleanup && brew prune && brew doctor'

# bat
alias oldcat=/bin/cat
alias cat=/usr/local/bin/bat

# fd
alias oldfind=/usr/bin/find
alias find=/usr/local/bin/fd

# k8s
alias k='kubectl'
alias ka='kubectl apply -f'
alias kconf='kubectl config view --minify'
alias kconfset='kubectl config set-context --current'
alias kd='kubectl describe'
alias kdel='kubectl delete'
alias kg='kubectl get'
alias kdelreapps='kg replicaset.apps | grep -E "([0]{1}\s*){3}" | awk "{print \"replicaset.apps/\"$1;}" | xargs kubectl delete'

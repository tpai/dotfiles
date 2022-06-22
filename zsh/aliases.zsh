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
alias olddf="/usr/bin/env df"
alias df='duf'
alias olddu="/usr/bin/env du"
alias du='olddu -h -d 2'

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='exa -alg --git'
  alias ls='exa -s ext'
fi

# Vim Aliases
if type nvim &> /dev/null; then
  alias vim='nvim'
fi
alias vi='vim'
alias :q='exit'         # mimic vim functions
alias ve='vim ~/.vimrc' # vimrc editing
alias ze='vim ~/.zshrc' # zsh profile editing

# Git Aliases
alias gl='vim +GV'
alias gv='vim +GV'
alias ga='git add -A'
alias gcm='git commit -m'
alias gcam='git commit --amend'
alias gco='git checkout'
alias gcob='git checkout -b'              # create branch
alias gco-='git checkout --'              # unchange changed files
alias gcfd='git clean -fd'                # remove untracked files
alias gfp='git fetch --all --prune'       # fetch and prune branch
alias gplr='git pull --rebase'            # pull and ff branch
alias gpu='git push -u origin $(git branch --show-current)'
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
alias oldcat="/usr/bin/env cat"
alias cat=bat

# fd
alias oldfind="/usr/bin/env find"
alias find=fd

# ping
alias oldping="/usr/bin/env ping"
alias ping="prettyping --nolegend"

# top
alias oldtop="/usr/bin/env top"
alias top="sudo htop" # use sudo to fix high sierra bug

# tldr
alias oldman="/usr/bin/env man"
alias man=tldr

# k8s
alias k='kubectl'
alias ka='kubectl apply -f'
alias kconf='kubectl config view --minify'
alias kconfset='kubectl config set-context --current'
alias kd='kubectl describe'
alias kdel='kubectl delete'
alias kdelrs="kubectl get replicaset.apps | grep -E \"([0]{1}\s*){3}\" | awk '{print \"replicaset.apps/\"\$1;}' | xargs kubectl delete"
alias kg='kubectl get'
alias kl='kubectl logs'

# list opened port
alias port='if [ "$(uname)" = "Darwin" ]; then lsof -Pni4 | grep LISTEN; else netstat -tulpn | grep LISTEN; fi'

# instant snippets
alias q='cd ~/.local/share/instant-snippets; vim +Rg; cd -'
alias qup='cd ~/.local/share/instant-snippets; git reset --hard HEAD; git pull --rebase; cd -'

# navigation
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'

# docker
if [[ $(uname -m) == 'arm64' ]]; then
  alias db='docker build'
  alias dr='docker run'
  alias dp='docker pull'
else
  alias db='docker build --platform=linux/amd64'
  alias dr='docker run --platform=linux/amd64'
  alias dp='docker pull --platform=linux/amd64'
fi

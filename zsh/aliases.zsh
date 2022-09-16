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
alias top="sudo glances" # use sudo to fix high sierra bug

# tldr
alias oldman="/usr/bin/env man"
alias man=tldr

# k8s
alias ka='kubectl apply -f'
alias kd='kubectl delete -f'
alias kcl='kubectl cluster-info'
alias kc='kubectl config'
alias kcv='kubectl config view --minify'
alias kcc='kubectl config current-context'
alias kcg='kubectl config get-contexts'
alias kcu='kubectl config use-context'
alias kcs='kubectl config set-context --current'
alias ktop='kubectl top'
alias ki='kubectl describe'
alias kg='kubectl get'
alias kl='kubectl logs'

# shortcut
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias port='if [ "$(uname)" = "Darwin" ]; then lsof -Pni4 | grep LISTEN; else netstat -tulpn | grep LISTEN; fi'
alias cidr='if [ "$(uname)" = "Darwin" ]; then ifconfig | grep "inet "; else eval $(ipcalc -np `ifconfig eth0 | sed -n "s/inet addr:\([^ ]*\).*Mask:\([^ ]*\).*/\1 \2/p"`); echo $NETWORK/$PREFIX; fi'

# instant snippets
alias q='cd ~/.local/share/instant-snippets; vim +Rg; cd -'
alias qup='cd ~/.local/share/instant-snippets; git reset --hard HEAD; git pull --rebase; cd -'

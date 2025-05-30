# PS
alias psa="ps aux"
alias psg="ps aux | grep "

# Show human friendly numbers and colors
alias olddf="/usr/bin/env df"
alias df='duf'
alias olddu="/usr/bin/env du"
alias du='olddu -h -d 2 | sort --reverse -h'

alias ll='eza -alg --git'
alias ls='eza -s ext'

# Vim Aliases
if type nvim &> /dev/null; then
  alias oldvim='/usr/bin/vim'
  alias vim='nvim'
  alias vi='nvim'
  alias vimrc='nvim ~/.vimrc'
  alias zshrc='nvim ~/.zshrc'
fi

# Git Aliases
alias gl='vim +GV'
alias gv='vim +GV'
alias ga='git add -A'
alias gcm='git commit -m'
alias gcam='git commit --amend'
alias gco='git checkout'
alias gcob='git checkout -b'              # create branch
alias gco-='git checkout --'              # unchange files
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
alias kD='kubectl delete -f'
alias kcl='kubectl cluster-info'
alias kc='kubectl config'
alias kcv='kubectl config view --minify'
alias kcc='kubectl config current-context'
alias kcg='kubectl config get-contexts'
alias kcu='kubectl config use-context'
alias kcD='kubectl config delete-context'
alias ktop='kubectl top'
alias ki='kubectl describe'
alias kg='kubectl get'
alias kl='kubectl logs'

# shortcuts
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias ports='if [ "$(uname)" = "Darwin" ]; then lsof -Pni4 | grep LISTEN; else netstat -tulpn | grep LISTEN; fi'
alias cidr='if [ "$(uname)" = "Darwin" ]; then ifconfig | grep "inet "; else eval $(ipcalc -np `ifconfig eth0 | sed -n "s/inet addr:\([^ ]*\).*Mask:\([^ ]*\).*/\1 \2/p"`); echo $NETWORK/$PREFIX; fi'
alias cs='curl -s'
alias cdl='curl -LJO'
alias cfl='curl -sSI -o /dev/null -L -D - '
alias :q='exit'
alias code='/Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/bin/code'

# knowledge base search
alias kb='cd ~/kb-search; vim +Telescope\ live_grep; cd -'
alias kbop='cd ~/kb-search'

#!/usr/bin/env bash

set -e

DOT=${HOME:=~}/.dotfiles

function toggle_plugin {
  PLUGIN=$(echo $1 | sed -e 's/\//\\\//g')
  if [ "$2" = "on" ]; then
    sed -i.bak -e "s/\" Plug '$PLUGIN'/Plug '$PLUGIN'/g" $DOT/vim/plugins.vim
  elif [ "$2" = "off" ]; then
    sed -i.bak -e "s/Plug '$PLUGIN'/\" Plug '$PLUGIN'/g" $DOT/vim/plugins.vim
  fi
}

case "$1" in
  foo)
    echo bar
    ;;
  ai)
    if ! which q &> /dev/null; then
      curl https://raw.githubusercontent.com/ibigio/shell-ai/main/install.sh | sudo bash
    fi
    ;;
  tf)
    if ! which terraform &> /dev/null; then
      brew tap hashicorp/tap
      brew install opentofu hashicorp/tap/terraform

      toggle_plugin 'hashivim/vim-hashicorp-tools' on
      vim -c 'PlugInstall'
    else
      brew upgrade opentofu hashicorp/tap/terraform

      toggle_plugin 'hashivim/vim-hashicorp-tools' on
      vim -c 'PlugUpdate'
    fi
    ;;
  go)
    if ! which go &> /dev/null; then
      bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
      source ~/.gvm/scripts/gvm
      gvm install go1.22.5 -B
      gvm use go1.22.5
      go version
      vim -c 'CocInstall coc-go | PlugInstall'
    else
      vim -c 'CocUpdate | PlugUpdate'
    fi
    ;;
  k8s)
    brew install k9s helm
    echo 'plugins:
  nodeShell:
    shortCut: s
    confirm: false
    description: Shell
    scopes:
      - node
    command: kubectl
    background: false
    args:
      - node-shell
      - $NAME
  copyDebug:
    shortCut: Shift-Y
    confirm: false
    description: Debug(--copy-to)
    scopes:
    - containers
    command: bash
    background: false
    args:
    - -c
    - "kubectl debug -it -n=$NAMESPACE $POD --share-processes --image busybox:1.36 --copy-to=copy-debugger"
  debug:
    shortCut: Shift-D
    confirm: false
    description: Debug(--target)
    scopes:
    - containers
    command: bash
    background: false
    args:
    - -c
    - "kubectl debug -it -n $NAMESPACE $POD --target $NAME --image busybox:1.35.0"' > $HOME/Library/Application\ Support/k9s/plugins.yaml
    ;;
  is)
    git clone git@github.com:tpai/instant-snippets.git "${HOME:=~}/.local/share/instant-snippets"
    ;;
esac

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
  tf)
    if ! which terraform &> /dev/null; then
      brew tap hashicorp/tap
      brew install hashicorp/tap/terraform

      toggle_plugin 'hashivim/vim-hashicorp-tools' on
      vim -c 'PlugInstall'
    else
      brew upgrade hashicorp/tap/terraform

      toggle_plugin 'hashivim/vim-hashicorp-tools' on
      vim -c 'PlugUpdate'
    fi
    ;;
  go)
    if ! which go &> /dev/null; then
      bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
      gvm install go1.20.2
      gvm use go1.20.2

      vim -c 'CocInstall coc-go | PlugInstall'
    else
      vim -c 'CocUpdate | PlugUpdate'
    fi
    ;;
  is)
    git clone git@github.com:tpai/instant-snippets.git "${HOME:=~}/.local/share/instant-snippets"
    ;;
esac

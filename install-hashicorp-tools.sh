#!/usr/bin/env bash

set -e

DOT_REPO=${HOME:=~}/.dotfiles

function toggle_plugin
{
  PLUGIN_NAME=$(echo $1 | sed -e 's/\//\\\//g')
  if [ "$2" = "on" ]; then
    sed -i.bak -e "s/\" Plug '$PLUGIN_NAME'/Plug '$PLUGIN_NAME'/g" $DOT_REPO/vim/plugins.vim
  elif [ "$2" = "off" ]; then
    sed -i.bak -e "s/Plug '$PLUGIN_NAME'/\" Plug '$PLUGIN_NAME'/g" $DOT_REPO/vim/plugins.vim
  fi
}

if ! which terraform &> /dev/null; then
  # install plugin
  toggle_plugin 'hashivim/vim-hashicorp-tools' on
  vim -c 'PlugInstall' -c q! -c q!
else
  # update plugin
  toggle_plugin 'hashivim/vim-hashicorp-tools' on
  vim -c 'PlugUpdate' -c q! -c q!
fi

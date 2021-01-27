#!/usr/bin/env bash

set -e

REPO=${HOME:=~}/.dotfiles

function create_symlink
{
  ln -nfs "$REPO/$1" "$HOME/$2"
}

function remove_symlink
{
  rm -rf $HOME/$1
}

function toggle_plugin
{
  PLUGIN_NAME=$(echo $1 | sed -e 's/\//\\\//g')
  if [ "$2" = "on" ]; then
    sed -i.bak -e "s/\" Plug '$PLUGIN_NAME'/Plug '$PLUGIN_NAME'/g" $REPO/vim/plugins.vim
  elif [ "$2" = "off" ]; then
    sed -i.bak -e "s/Plug '$PLUGIN_NAME'/\" Plug '$PLUGIN_NAME'/g" $REPO/vim/plugins.vim
  fi
}

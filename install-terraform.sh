#!/usr/bin/env bash

set -e

REPO=${HOME:=~}/.dotfiles

function toggle_plugin
{
  PLUGIN_NAME=$(echo $1 | sed -e 's/\//\\\//g')
  if [ "$2" = "on" ]; then
    sed -i.bak -e "s/\" Plug '$PLUGIN_NAME'/Plug '$PLUGIN_NAME'/g" $REPO/vim/plugins.vim
  elif [ "$2" = "off" ]; then
    sed -i.bak -e "s/Plug '$PLUGIN_NAME'/\" Plug '$PLUGIN_NAME'/g" $REPO/vim/plugins.vim
  fi
}

if ! which terraform &> /dev/null; then
  brew install hashicorp/tap/terraform hashicorp/tap/terraform-ls

  # install vim-terraform plugin
  toggle_plugin 'hashivim/vim-terraform' on
  vim -c 'PlugInstall' -c q! -c q!
else
  brew upgrade hashicorp/tap/terraform hashicorp/tap/terraform-ls

  # update vim-terraform plugin
  toggle_plugin 'hashivim/vim-terraform' on
  vim -c 'PlugUpdate' -c q! -c q!
fi

# append tf setting to coc
jq -s '.[0] * .[1]' $REPO/vim/settings/coc-settings.json $REPO/vim/settings/coc-settings-tf.json > vim/coc-settings.json
ln -nfs "$REPO/vim/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"

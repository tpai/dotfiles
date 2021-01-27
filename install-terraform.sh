#!/usr/bin/env bash

source _common.sh

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
create_symlink "vim/coc-settings.json" ".config/nvim/coc-settings.json"

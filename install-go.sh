#!/usr/bin/env bash

source _common.sh

if ! which go &> /dev/null; then
  brew install go

  # install vim-terraform plugin
  toggle_plugin 'fatih/vim-go' on
  vim -c 'PlugInstall' -c q! -c q!
else
  brew upgrade go

  # update vim-terraform plugin
  toggle_plugin 'fatih/vim-go' on
  vim -c 'PlugUpdate' -c q! -c q!
fi

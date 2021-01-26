#!/usr/bin/env bash

if ! which terraform-ls &> /dev/null; then
  brew install hashicorp/tap/terraform-ls
  jq -s '.[0] * .[1]' vim/settings/coc-settings.json vim/settings/coc-settings-tf.json > vim/coc-settings.json
  create_symlink "vim/settings/coc-settings.json" ".config/nvim/coc-settings.json"
else
  brew upgrade hashicorp/tap/terraform-ls
  jq -s '.[0] * .[1]' vim/settings/coc-settings.json vim/settings/coc-settings-tf.json > vim/coc-settings.json
  create_symlink "vim/settings/coc-settings.json" ".config/nvim/coc-settings.json"
fi

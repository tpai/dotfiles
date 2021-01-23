#!/usr/bin/env bash

if ! which go &> /dev/null; then
  brew install go
  vim -c 'PlugInstall vim-go' -c q! -c q!
else
  brew upgrade go
  vim -c 'PlugUpdate vim-go' -c q! -c q!
fi

#!/usr/bin/env bash

set -e

REPO=${HOME:=~}/.dotfiles

# Remove symlinks
rm -rf "$HOME/.local/share/nvim/site/autoload/plug.vim"
rm -rf "$HOME/.vim"
rm -rf "$HOME/.config/nvim/coc-settings.json"
rm -rf "$HOME/.config/nvim/init.vim"
rm -rf "$HOME/.vimrc.before"
rm -rf "$HOME/.vimrc.after"
rm -rf "$HOME/.tmux"
rm -rf "$HOME/.tmux.conf"
rm -rf "$HOME/.gitconfig"
rm -rf "$HOME/.zshrc"

# Restore old configs
if [ -d "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Sync/" ]; then
  rm -rf "$HOME/.ssh"
  rm -rf "$HOME/.kube"
  mv ~/.ssh-old ~/.ssh
  mv ~/.kube-old ~/.kube
else
  echo "iCloud sync folder does not exist."
fi

rm -rf $REPO

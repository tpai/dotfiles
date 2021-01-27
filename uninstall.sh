#!/usr/bin/env bash

source _common.sh

# Remove symlinks
remove_symlink ".local/share/nvim/site/autoload/plug.vim"
remove_symlink ".vim"
remove_symlink ".config/nvim/coc-settings.json"
remove_symlink ".config/nvim/init.vim"
remove_symlink ".vimrc.before"
remove_symlink ".vimrc.after"
remove_symlink ".tmux"
remove_symlink ".tmux.conf"
remove_symlink ".gitconfig"
remove_symlink ".zshrc"

rm -rf $REPO

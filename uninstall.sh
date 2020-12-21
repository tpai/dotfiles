#!/usr/bin/env bash

ROOT_DIR=.dotfiles

function remove_symlink
{
  rm -rf $HOME/$1
}

# Remove symlinks
remove_symlink ".local/share/nvim/site/autoload/plug.vim"
remove_symlink ".vim"
remove_symlink ".config/nvim/init.vim"
remove_symlink ".vimrc.before"
remove_symlink ".vimrc.after"
remove_symlink ".tmux"
remove_symlink ".tmux.conf"
remove_symlink ".gitconfig"
remove_symlink ".zshrc"

rm -rf $HOME/$ROOT_DIR

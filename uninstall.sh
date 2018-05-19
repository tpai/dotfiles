#!bin/sh

ROOT_DIR=.dotfiles

function remove_symlink
{
  rm -rf $HOME/$1
}

# Remove symlinks
remove_symlink ".vim"
remove_symlink ".vimrc"
remove_symlink ".vimrc.before"
remove_symlink ".vimrc.after"
remove_symlink ".tmux"
remove_symlink ".tmux.conf"
remove_symlink ".gitconfig"
remove_symlink ".zshrc"

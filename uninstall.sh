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

# Restore old configs
if [ -d "~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Sync/" ]; then
  remove_symlink "~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Sync/.ssh"
  remove_symlink "~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Sync/.kube"
  mv ~/.ssh-old ~/.ssh
  mv ~/.kube-old ~/.kube
else
  echo "iCloud directory does not exist."
fi

rm -rf $REPO

#!bin/sh

ROOT_DIR=.dotfiles

function create_symlink
{
  ln -nfs "$HOME/$ROOT_DIR/$1" "$HOME/$2"
}

if [[ "$(uname)" -ne "Darwin" ]]; then
  echo "This install script only support MacOS."
  exit 1
fi

if [ ! -d "$HOME/$ROOT_DIR" ]; then
  echo "Installing dotfiles for the first time..."

  # Clone dotfiles repo
  git clone --depth=1 https://github.com/tpai/dotfiles.git "$HOME/$ROOT_DIR"

  # Install tmux
  brew install zsh fasd tmux reattach-to-user-namespace the_silver_searcher
  brew install macvim --with-override-system-vim --with-lua --with-luajit
  brew link --overwrite macvim

  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # Change default shell
  chsh -s /bin/zsh

  # Create symlinks
  create_symlink "vim"              ".vim"
  create_symlink "vim/vimrc"        ".vimrc"
  create_symlink "vim/vimrc.before" ".vimrc.before"
  create_symlink "vim/vimrc.after"  ".vimrc.after"
  create_symlink "tmux"             ".tmux"
  create_symlink "tmux/tmux.conf"   ".tmux.conf"
  create_symlink "zsh/zshrc"        ".zshrc"
  create_symlink ".gitconfig"       ".gitconfig"

  # Install vim plugins
  vim +PlugInstall
else
  echo "Dotfiles is already installed!"
fi

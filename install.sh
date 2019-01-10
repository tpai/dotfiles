#!bin/sh

ROOT_DIR=.dotfiles

function create_symlink
{
  ln -nfs "$HOME/$ROOT_DIR/$1" "$HOME/$2"
}

if [[ "$(uname)" -ne "Darwin" ]]; then
  echo "😬 The dotfiles only support MacOS."
  exit 1
fi

if ! which brew &> /dev/null; then
  echo "🍺 Install brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! which git &> /dev/null; then
  echo "🐙 Install git"
  brew install git
fi

if ! which node &> /dev/null; then
  echo "🔯 Install node"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

  nvm install --lts
  nvm ls
fi

if [ ! -d "$HOME/$ROOT_DIR" ]; then
  echo "🌱 Install dotfiles for the first time"

  # Clone dotfiles repo
  git clone --depth=1 https://github.com/tpai/dotfiles.git "$HOME/$ROOT_DIR"

  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # Install shell related packages
  brew install zsh tmux reattach-to-user-namespace the_silver_searcher
  brew install exa bat fd jq wifi-password
  brew install macvim --with-override-system-vim --with-lua --with-luajit
  brew link --overwrite macvim

  # Create zsh symlink
  create_symlink "zsh/zshrc"        ".zshrc"

  # Change default shell
  sudo chsh -s /bin/zsh

  # Install development related packages
  brew install cmake python@2
  export PATH="/usr/local/opt/python@2/bin:$PATH"

  # Install fonts
  curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/DroidSansMono.zip | tar zx
  chmod 644 *.otf
  mv *.otf ~/Library/Fonts

  # Create symlinks
  create_symlink "vim"              ".vim"
  create_symlink "vim/vimrc"        ".vimrc"
  create_symlink "vim/vimrc.before" ".vimrc.before"
  create_symlink "vim/vimrc.after"  ".vimrc.after"
  create_symlink "tmux"             ".tmux"
  create_symlink "tmux/tmux.conf"   ".tmux.conf"
  create_symlink ".gitconfig"       ".gitconfig"

  # Install vim plugins
  vim +PlugInstall
else
  echo "🚀 Upgrading dotfiles..."

  # Switch to the latest master branch
  git stash
  git checkout master
  git pull --rebase
  git stash pop

  # Upgrade oh-my-zsh
  sh $ZSH/tools/upgrade.sh

  # Reset zsh symlink
  create_symlink "zsh/zshrc"        ".zshrc"

  # Upgrade packages
  brew upgrade zsh tmux reattach-to-user-namespace the_silver_searcher
  brew upgrade exa bat fd jq wifi-password
  brew upgrade cmake python@2
  brew upgrade macvim --with-override-system-vim --with-lua --with-luajit
  brew link --overwrite macvim

  # Reset symlinks
  create_symlink "vim"              ".vim"
  create_symlink "vim/vimrc"        ".vimrc"
  create_symlink "vim/vimrc.before" ".vimrc.before"
  create_symlink "vim/vimrc.after"  ".vimrc.after"
  create_symlink "tmux"             ".tmux"
  create_symlink "tmux/tmux.conf"   ".tmux.conf"
  create_symlink ".gitconfig"       ".gitconfig"

  # Upgrade vim-plug self and update plugins
  vim +PlugUpgrade -c q!
  vim +PlugInstall -c q!
fi

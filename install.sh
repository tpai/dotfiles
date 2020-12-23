#!bin/sh

ROOT_DIR=.dotfiles

function create_symlink
{
  ln -nfs "$HOME/$ROOT_DIR/$1" "$HOME/$2"
}

if [[ "$(uname)" -ne "Darwin" ]]; then
  echo "😬 This dotfiles only support Mac OS X"
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

  nvm install lts/carbon
  nvm ls
fi

if [ ! -d "$HOME/$ROOT_DIR" ]; then
  echo "🌱 Install dotfiles"

  # Clone dotfiles repo
  git clone --depth=1 https://github.com/tpai/dotfiles.git "$HOME/$ROOT_DIR"

  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # Install packages
  echo "📦 Install packages"
  brew install zsh tmux reattach-to-user-namespace the_silver_searcher \
               exa bat fasd fd jq wifi-password ripgrep neofetch onefetch \
               go watchman prettyping htop tldr
  brew install yarn --ignore-dependencies
  brew install macvim
  brew link --overwrite macvim

  # Create zsh symlink
  create_symlink "zsh/zshrc"        ".zshrc"

  # Install development related packages
  brew install cmake python python@2
  export PATH="/usr/local/opt/python@2/bin:$PATH"

  # Install fonts
  echo "📜 Copy fonts into system"
  cp -rf $HOME/$ROOT_DIR/fonts/* ~/Library/Fonts

  # Create symlinks
  echo "🔗 Create symlinks"
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
  echo "🚀 Upgrading dotfiles"

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
  echo "📦 Upgrade packages"
  brew upgrade zsh tmux reattach-to-user-namespace the_silver_searcher \
               exa bat fasd fd jq wifi-password ripgrep neofetch onefetch \
               go watchman prettyping htop tldr
  brew upgrade yarn
  brew upgrade macvim
  brew link --overwrite macvim
  brew upgrade cmake python python@2

  # Reset symlinks
  echo "🔗 Reset symlinks"
  create_symlink "vim"              ".vim"
  create_symlink "vim/vimrc"        ".vimrc"
  create_symlink "vim/vimrc.before" ".vimrc.before"
  create_symlink "vim/vimrc.after"  ".vimrc.after"
  create_symlink "tmux"             ".tmux"
  create_symlink "tmux/tmux.conf"   ".tmux.conf"
  create_symlink ".gitconfig"       ".gitconfig"

  # Upgrade vim-plug self and update plugins
  vim +PlugUpgrade -c q!
  vim +PlugUpdate -c q!
fi

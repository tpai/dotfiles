#!/usr/bin/env bash

source _common.sh

if [[ "$(uname)" -ne "Darwin" ]]; then
  echo "😬 This dotfiles only support Mac OS X"
  exit 1
fi

if ! type brew &> /dev/null; then
  echo "🍺 Install brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! type git &> /dev/null; then
  echo "🐙 Install git"
  brew install git
fi

if ! type node &> /dev/null; then
  echo "🔯 Install node"
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

  nvm install lts/carbon
  nvm ls
fi

if [ ! -d "$REPO" ]; then
  echo "🌱 Install dotfiles"

  # Clone dotfiles repo
  git clone --depth=1 https://github.com/tpai/dotfiles.git "$REPO"

  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # Install packages
  echo "📦 Install packages"
  # Misc
  brew install zsh tmux \
               ripgrep fasd fd \
               exa bat prettyping htop tldr duf \
               jq \
               neofetch onefetch wifi-password \
               reattach-to-user-namespace watchman \
  brew install yarn --ignore-dependencies

  # Install neovim
  brew install neovim
  mkdir -p ~/.local/share/nvim/site/autoload/
  mkdir -p ~/.config/nvim/
  python3 -m pip install --user --upgrade pynvim # Install required module

  # Create zsh symlink
  create_symlink "zsh/zshrc"        ".zshrc"

  # Install development related packages
  brew install cmake python python@2
  export PATH="/usr/local/opt/python@2/bin:$PATH"

  # Install fonts
  echo "📜 Copy fonts into system"
  cp -rf $REPO/fonts/* ~/Library/Fonts

  # Create coc settings
  cp $HOME/vim/settings/coc-settings.json $HOME/vim/coc-settings.json

  # Create symlinks
  echo "🔗 Create symlinks"
  create_symlink "vim/autoload/plug.vim" ".local/share/nvim/site/autoload/plug.vim"
  create_symlink "vim"                   ".vim"
  create_symlink "vim/coc-settings.json" ".config/nvim/coc-settings.json"
  create_symlink "vim/vimrc"             ".config/nvim/init.vim"
  create_symlink "vim/vimrc.before"      ".vimrc.before"
  create_symlink "vim/vimrc.after"       ".vimrc.after"
  create_symlink "tmux"                  ".tmux"
  create_symlink "tmux/tmux.conf"        ".tmux.conf"
  create_symlink ".gitconfig"            ".gitconfig"

  # Install vim plugins
  vim -c PlugInstall -c q! -c q!
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
  brew upgrade zsh tmux \
               ripgrep fasd fd \
               exa bat prettyping htop tldr duf \
               jq \
               neofetch onefetch wifi-password \
               reattach-to-user-namespace watchman \
  brew upgrade yarn
  brew upgrade neovim
  brew upgrade cmake python python@2

  # Reset symlinks
  echo "🔗 Reset symlinks"
  create_symlink "vim/autoload/plug.vim" ".local/share/nvim/site/autoload/plug.vim"
  create_symlink "vim"                   ".vim"
  create_symlink "vim/coc-settings.json" ".config/nvim/coc-settings.json"
  create_symlink "vim/vimrc"             ".config/nvim/init.vim"
  create_symlink "vim/vimrc.before"      ".vimrc.before"
  create_symlink "vim/vimrc.after"       ".vimrc.after"
  create_symlink "tmux"                  ".tmux"
  create_symlink "tmux/tmux.conf"        ".tmux.conf"
  create_symlink ".gitconfig"            ".gitconfig"

  # Upgrade vim-plug self and update plugins
  vim -c PlugUpgrade -c PlugUpdate -c q! -c q!
fi

#!/usr/bin/env bash

DOT=${HOME:=~}/.dotfiles

if [[ "$(uname)" -ne "Darwin" ]]; then
  echo "😬 This dotfiles only support MacOS"
  exit 1
fi

if ! type brew &> /dev/null; then
  echo "🍺 Install brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # activate brew instantly
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tony.pai/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if ! type git &> /dev/null; then
  echo "🐙 Install git"
  brew install git
fi

if ! type node &> /dev/null; then
  echo "🔯 Install node"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  nvm install lts/iron
  nvm use lts/iron
  nvm ls
fi

if ! type pyenv &> /dev/null; then
  echo "🐍 Install pyenv"
  brew install pyenv
  # Init pyenv manually
  eval "$(pyenv init -)"
  PYTHON_VERSION=3.12
  pyenv install $PYTHON_VERSION
  pyenv global $PYTHON_VERSION
  pyenv versions
fi

if [ ! -d "$DOT" ]; then
  echo "🌱 Install dotfiles"

  # Clone dotfiles repo
  git clone --depth=1 https://github.com/tpai/dotfiles.git "$DOT"

  # Create zsh symlink
  ln -nfs "$DOT/zsh/zshrc" "$HOME/.zshrc"

  # Install packages
  echo "📦 Install packages"
  # Misc
  brew install zsh tmux \
    ripgrep jq zoxide raycast fd duf \
    eza bat prettyping tldr mas httpie \
    ctop glances fastfetch onefetch wifi-password \
    reattach-to-user-namespace watchman cmake
  brew install --cask fork keka battery keycastr
  brew install yarn --ignore-dependencies

  # Install from App Store
  # Magnet, Bitwarden
  mas install 441258766 1352778147
  # Telegram, LINE
  mas install 539883307 747648890

  # Install neovim
  brew install neovim
  mkdir -p ~/.local/share/nvim/site/autoload/
  mkdir -p ~/.config/nvim/
  git config --global core.editor "nvim" # Set git default editor to neovim
  pip install --user --upgrade pynvim # Install python client

  # Install fonts
  echo "📜 Copy fonts into system"
  cp -rf $DOT/fonts/* /Library/Fonts

  # Create coc settings
  cp $DOT/vim/settings/coc-settings.json $DOT/vim/coc-settings.json

  # Create symlinks
  echo "🔗 Create symlinks"
  ln -nfs "$DOT/vim/autoload/plug.vim" "$HOME/.local/share/nvim/site/autoload/plug.vim"
  ln -nfs "$DOT/vim"                   "$HOME/.vim"
  ln -nfs "$DOT/vim/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
  ln -nfs "$DOT/vim/vimrc"             "$HOME/.config/nvim/init.vim"
  ln -nfs "$DOT/tmux"                  "$HOME/.tmux"
  ln -nfs "$DOT/tmux/tmux.conf"        "$HOME/.tmux.conf"
  ln -nfs "$DOT/.gitconfig"            "$HOME/.gitconfig"

  # Install sync configs
  if [ -d "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Sync/" ]; then
    mv $HOME/.ssh $HOME/.ssh-old || true
    mv $HOME/.kube $HOME/.kube-old || true
    ln -nfs "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Sync/.ssh" "$HOME/.ssh"
    ln -nfs "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Sync/.kube" "$HOME/.kube"
  else
    echo "iCloud sync folder does not exist."
  fi

  # Install vim plugins
  nvim -c PlugInstall -c q! -c q!

  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
else
  echo "🚀 Upgrading dotfiles"

  # Switch to the latest master branch
  git stash
  git checkout master
  git pull --rebase
  git stash pop

  # Reset zsh symlink
  ln -nfs "$DOT/zsh/zshrc" ".zshrc"

  # Upgrade packages
  echo "📦 Upgrade packages"
  brew upgrade zsh tmux \
    ripgrep jq zoxide raycast fd duf \
    eza bat prettyping tldr mas httpie \
    ctop glances fastfetch onefetch wifi-password \
    reattach-to-user-namespace watchman cmake
  brew upgrade --cask fork keka battery keycastr
  brew upgrade yarn
  brew upgrade neovim

  # Reset symlinks
  echo "🔗 Reset symlinks"
  ln -nfs "$DOT/vim/autoload/plug.vim" "$HOME/.local/share/nvim/site/autoload/plug.vim"
  ln -nfs "$DOT/vim"                   "$HOME/.vim"
  ln -nfs "$DOT/vim/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
  ln -nfs "$DOT/vim/vimrc"             "$HOME/.config/nvim/init.vim"
  ln -nfs "$DOT/tmux"                  "$HOME/.tmux"
  ln -nfs "$DOT/tmux/tmux.conf"        "$HOME/.tmux.conf"
  ln -nfs "$DOT/.gitconfig"            "$HOME/.gitconfig"

  # Reset sync configs
  if [ -d "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Sync/" ]; then
    rm -rf "$HOME/.ssh"
    rm -rf "$HOME/.kube"
    ln -nfs "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Sync/.ssh" "$HOME/.ssh"
    ln -nfs "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Sync/.kube" "$HOME/.kube"
  else
    echo "iCloud sync folder does not exist."
  fi

  # Upgrade vim-plug self and update plugins
  nvim -c PlugUpgrade -c PlugUpdate -c q! -c q!

  # Upgrade oh-my-zsh
  sh $ZSH/tools/upgrade.sh
fi

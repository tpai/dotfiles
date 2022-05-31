#!/usr/bin/env bash

set -e

export REPO=${HOME:=~}/.dotfiles

if [[ "$(uname)" -ne "Darwin" ]]; then
  echo "😬 This dotfiles only support Mac OS X"
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
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

  nvm install lts/carbon
  nvm ls
fi

if ! type pyenv &> /dev/null; then
  echo "🐍 Install pyenv"
  LATEST_PYTHON=$(pyenv install --list | grep -v - | grep -v b | tail -1)
  brew install pyenv
  pyenv install $LATEST_PYTHON
  pyenv global $LATEST_PYTHON
  pyenv versions
  # Init pyenv manually
  eval "$(pyenv init -)"
fi

if [ ! -d "$REPO" ]; then
  echo "🌱 Install dotfiles"

  # Clone dotfiles repo
  git clone --depth=1 https://github.com/tpai/dotfiles.git "$REPO"

  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

  # Install packages
  echo "📦 Install packages"
  # Misc
  brew install zsh tmux \
               ripgrep jq fasd fd duf \
               exa bat prettyping tldr mas httpie \
               ctop glances neofetch onefetch wifi-password \
               reattach-to-user-namespace watchman cmake
  brew install yarn --ignore-dependencies

  # Install from App Store
  # Alfred, Magnet, Bitwarden
  mas install 405843582 441258766 1352778147
  # Telegram, LINE
  mas install 539883307 747648890

  # Install neovim
  brew install neovim@0.6.1
  mkdir -p ~/.local/share/nvim/site/autoload/
  mkdir -p ~/.config/nvim/

  # Install python2 pip
  curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
  python2 get-pip.py && rm -rf get-pip.py
  $HOME/Library/Python/2.7/bin/pip install --user --upgrade pynvim # Install python client

  # Create zsh symlink
  ln -nfs "$REPO/zsh/zshrc" "$HOME/.zshrc"

  # Install fonts
  echo "📜 Copy fonts into system"
  cp -rf $REPO/fonts/* ~/Library/Fonts

  # Create coc settings
  cp $REPO/vim/settings/coc-settings.json $REPO/vim/coc-settings.json

  # Create symlinks
  echo "🔗 Create symlinks"
  ln -nfs "$REPO/vim/autoload/plug.vim" "$HOME/.local/share/nvim/site/autoload/plug.vim"
  ln -nfs "$REPO/vim"                   "$HOME/.vim"
  ln -nfs "$REPO/vim/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
  ln -nfs "$REPO/vim/vimrc"             "$HOME/.config/nvim/init.vim"
  ln -nfs "$REPO/vim/vimrc.before"      "$HOME/.vimrc.before"
  ln -nfs "$REPO/vim/vimrc.after"       "$HOME/.vimrc.after"
  ln -nfs "$REPO/tmux"                  "$HOME/.tmux"
  ln -nfs "$REPO/tmux/tmux.conf"        "$HOME/.tmux.conf"
  ln -nfs "$REPO/.gitconfig"            "$HOME/.gitconfig"

  # Install sync configs
  if [ -d "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Sync/" ]; then
    mv $HOME/.ssh $HOME/.ssh-old
    mv $HOME/.kube $HOME/.kube-old
    ln -nfs "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Sync/.ssh"  "$HOME/.ssh"
    ln -nfs "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Sync/.kube" "$HOME/.kube"
  else
    echo "iCloud sync folder does not exist."
  fi

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
  ln -nfs "$REPO/zsh/zshrc" ".zshrc"

  # Upgrade packages
  echo "📦 Upgrade packages"
  brew upgrade zsh tmux \
               ripgrep jq fasd fd duf \
               exa bat prettyping tldr mas httpie \
               ctop glances neofetch onefetch wifi-password \
               reattach-to-user-namespace watchman cmake
  brew upgrade yarn
  brew upgrade neovim

  # Reset symlinks
  echo "🔗 Reset symlinks"
  ln -nfs "$REPO/vim/autoload/plug.vim" "$HOME/.local/share/nvim/site/autoload/plug.vim"
  ln -nfs "$REPO/vim"                   "$HOME/.vim"
  ln -nfs "$REPO/vim/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
  ln -nfs "$REPO/vim/vimrc"             "$HOME/.config/nvim/init.vim"
  ln -nfs "$REPO/vim/vimrc.before"      "$HOME/.vimrc.before"
  ln -nfs "$REPO/vim/vimrc.after"       "$HOME/.vimrc.after"
  ln -nfs "$REPO/tmux"                  "$HOME/.tmux"
  ln -nfs "$REPO/tmux/tmux.conf"        "$HOME/.tmux.conf"
  ln -nfs "$REPO/.gitconfig"            "$HOME/.gitconfig"

  # Reset sync configs
  if [ -d "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Sync/" ]; then
    rm -rf "$HOME/.ssh"
    rm -rf "$HOME/.kube"
    ln -nfs "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Sync/.ssh"  "$HOME/.ssh"
    ln -nfs "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Sync/.kube" "$HOME/.kube"
  else
    echo "iCloud sync folder does not exist."
  fi

  # Upgrade vim-plug self and update plugins
  vim -c PlugUpgrade -c PlugUpdate -c q! -c q!
fi

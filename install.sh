#!/usr/bin/env bash

set -e

REPO=${HOME:=~}/.dotfiles

if [[ "$(uname)" -ne "Darwin" ]]; then
  echo "😬 This dotfiles only support Mac OS X"
  exit 1
fi

if ! type brew &> /dev/null; then
  echo "🍺 Install brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
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
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Install packages
  echo "📦 Install packages"
  # Misc
  brew install zsh tmux \
               ripgrep jq fasd fd duf \
               exa bat prettyping tldr mas httpie \
               ctop glances neofetch onefetch wifi-password \
               reattach-to-user-namespace watchman cmake \
  brew install yarn --ignore-dependencies

  # Install from App Store
  # Alfred, Magnet, Bitwarden
  mas install 405843582 441258766 1352778147
  # Telegram, LINE
  mas install 539883307 747648890

  # Install neovim
  brew install neovim
  mkdir -p ~/.local/share/nvim/site/autoload/
  mkdir -p ~/.config/nvim/
  pip install --user --upgrade pynvim # Install python client

  # Create zsh symlink
  create_symlink "zsh/zshrc"        ".zshrc"

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

  # Install sync configs
  if [ -d "~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Sync/" ]; then
    mv ~/.ssh ~/.ssh-old
    mv ~/.kube ~/.kube-old
    create_symlink "~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Sync/.ssh"  ".ssh"
    create_symlink "~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Sync/.kube" ".kube"
  else
    echo "iCloud directory does not exist."
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
  create_symlink "zsh/zshrc"        ".zshrc"

  # Upgrade packages
  echo "📦 Upgrade packages"
  brew upgrade zsh tmux \
               ripgrep jq fasd fd duf \
               exa bat prettyping tldr mas httpie \
               ctop glances neofetch onefetch wifi-password \
               reattach-to-user-namespace watchman cmake \
  brew upgrade yarn
  brew upgrade neovim

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

  # Reset sync configs
  if [ -d "~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Sync/" ]; then
    if [ ! -d "~/.ssh-old" ]; then
      mv ~/.ssh ~/.ssh-old
    else
      remove_symlink ".ssh"
    fi
    if [ ! -d "~/.kube-old" ]; then
      mv ~/.kube ~/.kube-old
    else
      remove_symlink ".kube"
    fi
    create_symlink "~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Sync/.ssh"  ".ssh"
    create_symlink "~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Sync/.kube" ".kube"
  else
    echo "iCloud directory does not exist."
  fi

  # Upgrade vim-plug self and update plugins
  vim -c PlugUpgrade -c PlugUpdate -c q! -c q!
fi

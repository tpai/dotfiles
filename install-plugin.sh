#!/usr/bin/env bash

DOT=${HOME:=~}/.dotfiles

function toggle_plugin {
  PLUGIN=$(echo $1 | sed -e 's/\//\\\//g')
  if [ "$2" = "on" ]; then
    sed -i.bak -e "s/\" Plug '$PLUGIN'/Plug '$PLUGIN'/g" $DOT/vim/plugins.vim
  elif [ "$2" = "off" ]; then
    sed -i.bak -e "s/Plug '$PLUGIN'/\" Plug '$PLUGIN'/g" $DOT/vim/plugins.vim
  fi
}

case "$1" in
  foo)
    echo bar
    ;;
  cagent)
    if ! which claude &> /dev/null; then
      curl -fsSL https://claude.ai/install.sh | bash
    fi

    if ! which codex &> /dev/null; then
      curl -fsSL https://chatgpt.com/codex/install.sh | sh
    fi

    if ! which opencode &> /dev/null; then
      curl -fsSL https://opencode.ai/install | bash
    fi
    ;;
  skills)
      claude plugin marketplace add ./deps/mattpocock-skills/skills
      claude plugin install mattpocock-skills@mattpocok
      cp -r ./deps/mattpocock-skills/skills/* ~/.agents/skills
      cp -r ./deps/mattpocock-skills/skills/* ~/.codex/skills
      claude plugin marketplace add ./deps/tp-skills
      claude plugin install tp-skills@tpai
      cp -r ./deps/tp-skills/* ~/.agents/skills
      cp -r ./deps/tp-skills/* ~/.codex/skills
    ;;
  cloud)
    if ! which az &> /dev/null; then
      brew install azure-cli Azure/kubelogin/kubelogin
    fi

    if ! which aws &> /dev/null; then
      brew install awscli
    fi

    if ! which gcloud &> /dev/null; then
      brew install --cask gcloud-cli
      gcloud components install gke-gcloud-auth-plugin
    fi
    ;;
  tf)
    if ! which terraform &> /dev/null; then
      brew tap hashicorp/tap
      brew install opentofu hashicorp/tap/terraform

      toggle_plugin 'hashivim/vim-hashicorp-tools' on
      nvim -c 'PlugInstall'
    else
      brew upgrade opentofu hashicorp/tap/terraform

      toggle_plugin 'hashivim/vim-hashicorp-tools' on
      nvim -c 'PlugUpdate'
    fi
    ;;
  go)
    if ! which go &> /dev/null; then
      bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
      source ~/.gvm/scripts/gvm
      gvm install go1.25 -B
      gvm use go1.25 --default
      go version
      nvim -c 'CocInstall coc-go | PlugInstall'
    else
      nvim -c 'CocUpdate | PlugUpdate'
    fi
    ;;
  rust)
    if ! which rust &> /dev/null; then
      curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
      rustc --version
      cargo --version
      rustup --version
    fi
    ;;
  k8s)
    brew install k9s kubectl helm skopeo
    mkdir -p $HOME/Library/Application\ Support/k9s
    echo 'plugins:
  debug:
    shortCut: Shift-D
    description: Add debug container
    scopes:
      - containers
    command: bash
    background: false
    args:
      - -c
      - "kubectl debug -it --context $CONTEXT -n=$NAMESPACE $POD --target=$NAME --image=nicolaka/netshoot:v0.13 --share-processes -- bash"' > $HOME/Library/Application\ Support/k9s/plugins.yaml
    ;;
esac

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

# Skill sources: <path-to-repo>:<claude-marketplace-name>:<claude-plugin-ids>
# (plugin ids are comma-separated; empty marketplace/plugins = copy skills to
# agents/codex only, skip the claude plugin steps)
SKILL_SOURCES=(
  "deps/mattpocock-skills:mattpocock:mattpocock-skills"
  "deps/tp-skills:tpai:tp-skills@tpai"
  "deps/anthropics-skills::"
)

function install_skills {
  local entry path marketplace plugins plugin_ids plugin_id dest
  for entry in "${SKILL_SOURCES[@]}"; do
    IFS=':' read -r path marketplace plugins <<< "$entry"
    if [[ -n "$marketplace" ]]; then
      IFS=',' read -ra plugin_ids <<< "$plugins"
      echo "==> claude: add marketplace $marketplace ($path)"
      claude plugin marketplace add "$DOT/$path"
      for plugin_id in "${plugin_ids[@]}"; do
        echo "==> claude: install plugin $plugin_id"
        claude plugin install "$plugin_id"
      done
    fi
    for dest in "$HOME/.agents/skills" "$HOME/.codex/skills"; do
      echo "==> copy skills to $dest"
      mkdir -p "$dest"
      cp -r "$DOT/$path/skills/"* "$dest/"
    done
  done
}

function uninstall_skills {
  local entry path marketplace plugins plugin_ids plugin_id dest skill
  echo "This will remove the deps skills from ~/.agents/skills and ~/.codex/skills,"
  echo "and uninstall the claude plugins + marketplaces."
  read -r -p "Continue? [y/N] " answer
  if [[ ! "$answer" =~ ^[Yy]$ ]]; then
    echo "aborted"
    exit 0
  fi

  for entry in "${SKILL_SOURCES[@]}"; do
    IFS=':' read -r path marketplace plugins <<< "$entry"
    echo "==> remove skills copied from $path"
    for skill in "$DOT/$path/skills/"*; do
      [ -e "$skill" ] || continue
      name=$(basename "$skill")
      for dest in "$HOME/.agents/skills" "$HOME/.codex/skills"; do
        [[ -n "$dest" && -e "$dest/$name" ]] && rm -rf "${dest:?}/$name"
      done
    done
    if [[ -n "$marketplace" ]]; then
      IFS=',' read -ra plugin_ids <<< "$plugins"
      for plugin_id in "${plugin_ids[@]}"; do
        echo "==> claude: uninstall plugin $plugin_id"
        claude plugin uninstall "$plugin_id" || true
      done
      echo "==> claude: remove marketplace $marketplace"
      claude plugin marketplace remove "$marketplace" || true
    fi
  done
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
    case "$2" in
      ""|i)
        install_skills
        ;;
      u)
        uninstall_skills
        ;;
      *)
        echo "usage: $0 skills [i|u]" >&2
        exit 1
        ;;
    esac
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

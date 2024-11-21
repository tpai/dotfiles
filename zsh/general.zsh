# k8s
export KUBE_EDITOR=nvim
export K9S_FEATURE_GATE_NODE_SHELL=true

kubeconfig_files=$(ls -xm $HOME/.kube/*.kubeconfig 2>/dev/null)
if [[ -n $kubeconfig_files ]]; then
  export KUBECONFIG=/Users/$USER/.kube/config:$(echo `ls -xm ~/.kube/*.kubeconfig` | sed 's/ /:/g')
else
  export KUBECONFIG=/Users/$USER/.kube/config
fi

# M1
if [[ $(arch) == 'arm64' ]]; then
  export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
  export DOCKER_DEFAULT_PLATFORM=linux/amd64
fi

# history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

# hey brew don't mess up with me
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

# git
export LANG=en_US.UTF-8

# go
export PATH=$PATH:/Users/$USER/.gvm/scripts/gvm
export GO111MODULE=on

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Python
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
alias python="$(pyenv which python)"
alias pip="$(pyenv which pip)"

# OpenAI
export OPENAI_API_KEY=
export AZURE_OPENAI_API_KEY=

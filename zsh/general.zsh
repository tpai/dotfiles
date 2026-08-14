# k8s
export KUBE_EDITOR=nvim
export K9S_FEATURE_GATE_NODE_SHELL=true

kubeconfig_files=$(ls -xm $HOME/.kube/*.kubeconfig 2>/dev/null)
if [[ -n $kubeconfig_files ]]; then
  export KUBECONFIG=/Users/$USER/.kube/config:$(echo `ls -xm ~/.kube/*.kubeconfig` | sed 's/ /:/g')
else
  export KUBECONFIG=/Users/$USER/.kube/config
fi

# ARM arch
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

# exclude ._* files from tar file
export COPYFILE_DISABLE=1

# git
export LANG=en_US.UTF-8

# go
export PATH=$PATH:/Users/$USER/.gvm/scripts/gvm
export GO111MODULE=on

# node: homebrew node only (no nvm)

# Python
# Fast pyenv setup: export shims directly instead of running slow `pyenv init -`
# at every shell startup (saves ~1.5s). `pyenv shell` support is initialized
# lazily on first use of the `pyenv` command.
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
pyenv() {
  unset -f pyenv
  eval "$(command pyenv init -)"
  pyenv "$@"
}
# Direct aliases: avoid `pyenv which` subprocess at startup AND per-invocation
# shim overhead. Keep in sync with the version in ~/.pyenv/version.
alias python="$PYENV_ROOT/versions/3.12.13/bin/python"
alias pip="$PYENV_ROOT/versions/3.12.13/bin/pip"

# OpenAI
export OPENAI_API_KEY=
export AZURE_OPENAI_API_KEY=

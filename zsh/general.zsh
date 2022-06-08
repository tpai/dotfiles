# k8s
export KUBE_EDITOR=vim
export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config

# M1
if [[ $(arch) == 'arm64' ]]; then
  export PATH=/opt/homebrew/bin:$PATH
  export PATH=/opt/homebrew/sbin:$PATH
fi

# init pyenv
eval "$(pyenv init -)"

# history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

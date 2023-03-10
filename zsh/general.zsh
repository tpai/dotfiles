# k8s
export KUBE_EDITOR=vim
export KUBECONFIG=/Users/$USER/.kube/config:$(echo `ls -xm ~/.kube/*.yaml` | sed 's/ /:/g')

# M1
if [[ $(arch) == 'arm64' ]]; then
  export PATH=/opt/homebrew/bin:$PATH
  export PATH=/opt/homebrew/sbin:$PATH
  export DOCKER_DEFAULT_PLATFORM=linux/amd64
fi

# init pyenv
eval "$(pyenv init -)"

# history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

# hey brew don't mess up with me
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

# git
export LANG=en_US.UTF-8

# OpenAI
export OPENAI_API_KEY=

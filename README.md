# Dotfiles

These dotfiles is build based on my mac development environment, please consider properly before you run the install script.

## Install

```
sh -c "`curl -fsSL https://raw.githubusercontent.com/tpai/dotfiles/master/install.sh `"
```

Paster the following line into iTerm `Profiles > General > Command > Send text at start`

```
tmux new
```

## Update

```
sh ~/.dotfiles/install.sh
```

It will auto update required brew formula, vim plugins and oh-my-zsh.

## Uninstall

```
sh ~/.dotfiles/uninstall.sh
```

Run this command if you are no longer need the dotfiles.

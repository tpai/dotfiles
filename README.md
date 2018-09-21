# Dotfiles

Dotfiles are built based on my development environment, please consider properly before run the install command.

## Features

- tmux
- emmet
- syntastic
- nerdtree
- fzf
- vim-javascript
- vim-jsx
- vim-pug

## Install

1. Run install script

    ```
    sh -c "`curl -fsSL https://raw.githubusercontent.com/tpai/dotfiles/master/install.sh `"
    ```

2. Paste `tmux` into iTerm `Profiles > General > Command > Send text at start`

3. `Profiles > Text > Change Font > Family > DriodSansMono Nerd Font`

## Update

```
sh ~/.dotfiles/install.sh
```

It will auto update required brew formula, vim plugins and oh-my-zsh.

## Uninstall

```
sh ~/.dotfiles/uninstall.sh
```

If you are no longer need dotfiles.

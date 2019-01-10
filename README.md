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

## Mappings

The following keys are my most used commands.

### Vim

* TMUX
  * `tmux ls` - list sessions
  * `tmux new -s <id>` - create new session
  * `tmux attach -t <id>` - attach to specific session
  * `<C-a d>` - detach session
  * `tmux kill -t <id>` - kill session
* Window
  * `<C-a c>` - create window
  * `<C-a n>` - next window
  * `<C-a p>` - previous window
  * `<C-a x>` - kill window
* Pane
  * `<C-h,j,k,l>` - navigate between panes
  * `<C-a Shift-h,j,k,l>` - resize focused pane
  * `vv` - vertical split
  * `ss` - horizontal split
  * `<C-a PgUp,PgDown>` - scroll
* NERDtree
  * `<C-\>` - toggle NERDTree
  * `?` - show help
* File Navigation
  * `,t` - in current folder (based on `ctrlp`)
  * `,b` - in buffer (based on `fzf`)
  * `,ag` - using fuzzy search (based on `fzf`)
* Git
  * `gv@` - browse changes of commits of all files
  * `gv!` - browse changes of commits of current file
  * `gs` - git status (next: `<C-n>`, prev: `<C-p>`)
  * `gj` - next hunk
  * `gk` - prev hunk
  * `gu` - undo changes of current hunk
  * `gp` - see changes of current hunk
  * `:Gblame` - blame someone about code
* Editing
  * `sj` - split brackets
  * `sk` - join brackets
  * `<C-f>` - format snippet (forward: `<C-l>`, backward: `<C-b>`)
  * `<C-m>` - emmet for HTML, CSS and JSX
  * `,mc` - multi cursor (next: `<C-n>`, prev: `<C-p>`, skip: `<C-x>`)
  * `<\-p>` - prettify code
  * `gc` - comment / uncomment
  * `<C-//>` - comment / uncomment
  * `:%s/search/replace/g` - search and replace
  * `//` - clear search result
  * `%` - jump to closing tag
  * `:e ++ff=dos` - convert `^M` to unix line ending

### Shell

* `z` - cd to folder using fuzzy search (based on `fzf`)
* `find` - better file search (based on `fd`)
* `ll` - list files in current folder with details (based on `exa`)
* `cat` - print beautified file content (based on `bat`)
* `jq` - parse json text (e.g. `echo '{"a": 1}' | jq .a`)
* `wifi-password` - fetch wifi password of connected SSID

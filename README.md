# Dotfiles

This dotfiles is built for JS and Typescript development.

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

Update required brew formula, vim plugins and oh-my-zsh.

## Uninstall

```
sh ~/.dotfiles/uninstall.sh
```

Return to dust.

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
  * `,t` - in current folder (support by `ctrlp`)
  * `,b` - in buffer (support by `fzf`)
  * `,ag` - using fuzzy search (support by `fzf`)
* Git
  * `gva` - browse changes of commits of all files
  * `gvc` - browse changes of commits of current file
  * `gs` - git status (next: `<C-n>`, prev: `<C-p>`)
  * `gj` - next hunk
  * `gk` - prev hunk
  * `gu` - undo changes of current hunk
  * `gp` - see changes of current hunk
  * `:Gblame` - blame someone about code
* Editing
  * `sj` - split brackets
  * `sk` - join brackets
  * `ga` - active easy align (must do visual select first)
  * `<C-f>` - format snippet (forward: `<C-l>`, backward: `<C-b>`)
  * `<C-m>,` - emmet for HTML, CSS and JSX
  * `,mc` - multi cursor (next: `<C-n>`, prev: `<C-p>`, skip: `<C-x>`)
  * `,jd` - go to definition (support by YCM)
  * `<\-p>` - prettify code
  * `gc` - comment / uncomment
  * `<C-//>` - comment / uncomment
  * `:%s/search/replace/g` - search and replace
  * `//` - clear search result
  * `%` - jump to closing tag
  * `:e ++ff=dos` - convert `^M` to unix line ending

### Shell

* `z` - cd to folder using fuzzy search (support by `fzf`)
* `find` - better file search (support by `fd`)
* `ll` - list files in current folder with details (support by `exa`)
* `cat` - print beautified file content (support by `bat`)
* `jq` - parse json text (e.g. `echo '{"a": 1}' | jq .a`)
* `wifi-password` - fetch wifi password of connected SSID

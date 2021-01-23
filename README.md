# Dotfiles

This dotfiles is built for JS and Typescript development.

## Install

1. Run install script

    ```
    sh -c "`curl -fsSL https://raw.githubusercontent.com/tpai/dotfiles/master/install.sh `"
    ```

2. Paste `tmux` into iTerm `Profiles > General > Command > Send text at start`

3. `Profiles > Text > Change Font > Family > DroidSansMono Nerd Font`

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

## Brew Packages

* Main
  * zsh
  * tmux
* Search
  * ripgrep - code fuzzy search
  * fasd - folder search and navigation
  * fd - file and folder search
* Better Command
  * exa - ls
  * bat - cat
  * prettyping - ping
  * htop - top
  * tldr - man
  * duf - df
* Language
  * go
  * jq - json query
* Info
  * neofetch - system info
  * onefetch - git repo info
  * wifi-password
* Misc
  * reattach-to-user-namespace - for tmux clipboard
  * watchman - coc file renaming (update related imports)
  * git
  * yarn
  * neovim
  * cmake
  * python
  * python@2

## Mappings

The following keys are my most used commands.

### Vim

* TMUX
  * `tmux ls` - list sessions
  * `tmux new -s <id>` - create new session
  * `tmux attach -t <id>` - attach to specific session
  * `<C-a d>` - detach session
  * `tmux kill -t <id>` - kill session
  * `<C-a \<>` - open status line menu
  * `<C-a \>>` - open pane menu
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
* Floating Window
  * `<Shift-j>` - scroll down
  * `<Shift-k>` - scroll up
* NERDtree
  * `<C-\>` - toggle NERDTree
  * `?` - show help
* File Navigation
  * `,t` - in current folder (provided by `ctrlp`)
  * `,b` - in buffer (provided by `fzf`)
  * `,ag` - using fuzzy search (provided by `fzf`)
* Git
  * `gva` - browse changes of commits of all files
  * `gvc` - browse changes of commits of current file
  * `gs` - git status (next: `<C-n>`, prev: `<C-p>`)
  * `gb` - git blame
  * `gd` - git diff
  * `gj` - next hunk
  * `gk` - prev hunk
  * `gu` - undo changes of current hunk
  * `gp` - see changes of current hunk
  * `:Gblame` - blame someone about code
* Editing
  * `sj` - split brackets
  * `sk` - join brackets
  * `ga` - active easy align (must do visual select first)
  * `,mc` - multiple cursor (next: `<C-n>`, prev: `<C-p>`, skip: `<C-x>`)
  * `,ma` - multiple cursor select all words
  * `gc` - comment / uncomment
  * `<C-//>` - comment / uncomment
  * `:%s/search/replace/g` - search and replace
  * `//` - clear search result
  * `%` - jump to closing tag
  * `:e ++ff=dos` - convert `^M` to unix line ending
  * `<\-p>` - prettify
  * `<\-f>` - eslint autofix
  * `ej` - next diagnostic
  * `ek` - prev diagnostic
  * `,df` - show definition in floating window
  * `,jd` - go to definition
  * `,jr` - list references
  * `,rn` - symbol renaming
  * `,rf` - file renaming (require `watchman` to be installed)
  * `,ac` - show code action dialog
  * `,cj` - create jsdoc for function
  * `,,c` - convert to cammel case
  * `,,s` - convert to snake case
  * `,,r` - convert to rem
  * `,,p` - convert to px

### Console

* `z` - cd to folder using fuzzy search (provided by `fzf`)
* `ctrl+r` - fuzzy search used commands (provided by `fzf`)
* `ping` - pretty ping (provided by `prettyping`)
* `top` - awesome interactive process viewer (provided by `htop`)
* `find` - better file search (provided by `fd`)
* `ll` - list files in current folder with details (provided by `exa`)
* `cat` - print beautified file content (provided by `bat`)
* `jq` - parse json text (e.g. `echo '{"a": 1}' | jq .a`)
* `tldr` - neat man page (e.g. `tldr ls`)
* `wifi-password` - fetch wifi password of connected SSID

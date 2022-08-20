# Dotfiles

This dotfiles is built for JS and Typescript development.

## Installation

1. Run install script

   ```
   sh -c "`curl -fsSL https://raw.githubusercontent.com/tpai/dotfiles/master/install.sh `"
   ```

2. Paste `tmux` into iTerm `Profiles > General > Command > Send text at start`

3. `Profiles > Text > Change Font > Family > DroidSansMono Nerd Font`


### Update

```sh
./install.sh
```

Update required brew formula, vim plugins and oh-my-zsh.

### Uninstall

```sh
./uninstall.sh
```

Return to dust.

## Install Plugin

```sh
./install-plugin.sh {plugin}
```

- foo - test usage
- tf - install terraform, vim-hashicorp-tools
- go - install go, vim-go
- snip - install instant-snippets

## Brew Packages

- Main
  - zsh
  - tmux
- Search
  - ripgrep - code fuzzy search
  - fasd - folder search and navigation
  - fd - file and folder search
- Better Command
  - exa - ls
  - bat - cat
  - prettyping - ping
  - glances - top
  - ctop - ctop
  - tldr - man
  - duf - df
- Language
  - jq - json query
- Info
  - neofetch - system info
  - onefetch - git repo info
  - wifi-password
- Misc
  - reattach-to-user-namespace - for tmux clipboard
  - watchman - coc file renaming (update related imports)
  - git
  - yarn
  - neovim
  - cmake
  - pyenv
  - nvm

## Mappings

The following keys are my most used commands.

### tmux

- `tmux ls` - list sessions
- `tmux new -s <id>` - create new session
- `tmux attach -t <id>` - attach to specific session
- `tmux kill -t <id>` - kill session
- `<C-a d>` - detach session
- `<C-a \<>` - open status line menu
- `<C-a \>>` - open pane menu
- `<C-a :setw synchronize-panes on>` - all panes share the same input
- `<C-a c>` - create window
- `<C-a n>` - next window
- `<C-a p>` - previous window
- `<C-a x>` - kill window
- `<C-a :move-window -r>` - reorder window index
- `<C-h,j,k,l>` - navigate between windows
- `<C-a Shift-h,j,k,l>` - resize focused window
- `<C-a PgUp,PgDown>` - scroll the window

### vim

- Panes
  - `<C-h,j,k,l>` - navigate between panes
  - `vv` - vertical split
  - `ss` - horizontal split
- Floating Window
  - `<Shift-j>` - scroll down
  - `<Shift-k>` - scroll up
- NERDtree
  - `<C-\>` - toggle NERDTree
  - `?` - show help
- File Navigation
  - `,t` - in current folder (powered by `ctrlp`)
  - `,b` - in buffer (powered by `fzf`)
  - `,ag` - using fuzzy search (powered by `fzf`)
    - `<Tab>` - select files which needs to change
    - `:cfdo %s/old/new/g | update` - search, replace and update multiple files
- Git
  - `gva` - browse changes of commits of all files
  - `gvc` - browse changes of commits of current file
  - `gs` - git status (next: `<C-n>`, prev: `<C-p>`)
  - `gb` - git blame
  - `gd` - git diff
  - `gj` - next hunk
  - `gk` - prev hunk
  - `gu` - undo changes of current hunk
  - `gp` - see changes of current hunk
- Editing
  - `sj` - split brackets
  - `sk` - join brackets
  - `ga` - active easy align (must do visual select first)
  - `,mc` - multiple cursor (next: `<C-n>`, prev: `<C-p>`, skip: `<C-x>`)
  - `,ma` - multiple cursor select all words
  - `gc` - comment / uncomment
  - `<C-//>` - comment / uncomment
  - `:%s/old/new/g` - search and replace in current file
  - `//` - clear search result
  - `%` - jump to closing tag
  - `:e ++ff=dos` - convert `^M` to unix line ending
  - `<\-p>` - prettify
  - `<\-f>` - eslint autofix
  - `ej` - next diagnostic
  - `ek` - prev diagnostic
  - `,df` - show definition in floating window
  - `,jd` - go to definition
  - `,jr` - list references
  - `,rn` - symbol renaming
  - `,rf` - file renaming (require `watchman` to be installed)
  - `,ac` - show code action dialog
  - `,cj` - create jsdoc for function
  - `,,c` - convert to cammel case
  - `,,s` - convert to snake case
  - `,,r` - convert to rem
  - `,,p` - convert to px

### Console

- `z` - cd to folder using fuzzy search
- `ctrl+r` - fuzzy search used commands
- `ping` - pretty ping
- `top` - awesome interactive process viewer
- `ctop` - docker terminal UI
- `find` - better file search
- `l` - list files in current folder with details
- `cat` - print beautified file content
- `jq` - json text parser (e.g. `echo '{"a": 1}' | jq .a`)
- `man` - neat man page (e.g. `man ls`)
- `http|https` - friendly HTTP request tool
- `wifi-password` - retrieve connected wifi password
- `port` - list listening ports
- `icloud` - navigate to iCloud directory
- `q` - query from instant snippets
- `qup` - update instant snippets repo

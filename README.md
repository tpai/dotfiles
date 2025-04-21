# Dotfiles

The purpose of this repository is to enhance my terminal and IDE setup for improved productivity.

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

Update required brew formulas, vim plugins and oh-my-zsh.

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
- kb - install kb-search

## Brew Packages

- Main
  - zsh
  - tmux
- Search
  - ripgrep - code fuzzy search
  - zsh-z - folder navigation
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
  - `<C-a e>` - enable sync mode for all panes
  - `<C-a E>` - disable sync mode
  - `vv` - vertical split
  - `ss` - horizontal split
- Floating Window
  - `<Shift-j>` - scroll down
  - `<Shift-k>` - scroll up
- NERDtree
  - `<C-\>` - toggle NERDTree
  - `?` - show help
- File
  - `:new` - create new file
- File Navigation
  - `,t` - in current folder (powered by `ctrlp`)
  - `,b` - in buffer (powered by `fzf`)
  - `,ag` - using fuzzy search (powered by `fzf`)
    - `<Tab>` - select files which needs to change
    - `:cfdo %s/old/new/g | update` - search, replace and update multiple files
- Diff
  - `:windo diffthis` - diff check for active files
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
  - splitjoin
      - `sj` - split brackets
      - `sk` - join brackets
  - easy-align
      - `ga` - active easy align (must do visual select first)
  - multiple-cursors
      - `,mc` - multiple cursor (next: `<C-n>`, prev: `<C-p>`, skip: `<C-x>`)
      - `,ma` - multiple cursor select all words
  - gp
      - `,k` - (normal) send GPT prompt and append result
      - `,k` - (visual) send GPT prompt and rewrite selected content
      - `,p` - (normal) send GPT prompt and show result on a popup
      - `,K` - stop GPT generating 
  - coc
      - `ej` - next diagnostic
      - `ek` - prev diagnostic
      - `,df` - show definition in floating window
      - `,jd` - go to definition
      - `,jr` - list references
      - `,rn` - symbol renaming
      - `,rf` - file renaming (require `watchman` to be installed)
      - `,ac` - show code action dialog
  - jsdoc
      - `,cj` - create jsdoc for function
  - camelsnek
      - `,,c` - convert to cammel case
      - `,,s` - convert to snake case
  - px-to-rem
      - `,,r` - convert to rem
      - `,,p` - convert to px
  - zk
      - `\zn` - create a ZK note
      - `\zf` - search ZK notes
  - misc
      - `:%s/old/new/g` - search and replace for the current file
      - `:vimgrep /old/g **/*` > `:cfdo %s/old/new/g | update` - search and repalce for all files
      - `:e ++ff=dos` - convert `^M` to unix line ending
      - `gc` - comment / uncomment
      - `//` - clear search result
      - `%` - jump to closing tag
      - `<\-p>` - prettify
      - `<\-f>` - eslint autofix

### Console

- `z` - cd to a folder using fuzzy search
- `ctrl+r` - fuzzy search for used commands
- `ping` - display pretty ping
- `top` - awesome interactive process viewer
- `ctop` - docker terminal UI
- `find` - improved file search
- `l` - list files in the current folder with details
- `cat` - print beautified file contents
- `jq` - JSON text parser (e.g. `echo '{"a": 1}' | jq .a`)
- `man` - neat man pages (e.g. `man ls`)
- `http|https` - friendly HTTP request tool
- `wifi-password` - retrieve the connected WiFi password
- `port` - list listening ports
- `icloud` - navigate to the iCloud directory
- `exiftool` - print image metadata

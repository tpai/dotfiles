# Dotfiles

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

Updates brew formulas, vim plugins and oh-my-zsh.

### Uninstall

```sh
./uninstall.sh
```

## Install Plugin

```sh
./install-plugin.sh {plugin}
```

- codeagent - install claude, opencode
- tf - install terraform, vim-hashicorp-tools
- go - install go, vim-go

## Mappings

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
  - `]]` - next markdown block
  - `]p` - preview markdown
- File Navigation
  - `,t` - files in current folder (powered by `Telescope`)
  - `,b` - buffer files (powered by `Telescope`)
  - `,ag` - fuzzy search (powered by `Telescope`)
    - `<Tab>` - select files which needs to change
    - `:cfdo %s/old/new/g | update` - search, replace and update multiple files
- Editing
  - git
      - `gl` - show commits
      - `gh` - show file history
      - `gb` - blame file
      - `gd` - diff file
      - `gj` - navigate to next hunk
      - `gk` - navigate to prev hunk
      - `ga` - stage current hunk
      - `gu` - undo current hunk
      - `gp` - reset hard
      - `gr` - reset soft
  - splitjoin
      - `sj` - split brackets
      - `sk` - join brackets
  - easy-align
      - `ga` - active easy align (must do visual select first)
  - multiple-cursors
      - `,mc` - multiple cursor (next: `<C-n>`, prev: `<C-p>`, skip: `<C-x>`)
      - `,ma` - multiple cursor select all words
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
      - `,,c` - convert to camel case
      - `,,s` - convert to snake case
  - px-to-rem
      - `,,r` - convert to rem
      - `,,p` - convert to px
  - misc
      - `:%s/old/new/g` - search and replace for the current file
      - `:vimgrep /old/g **/*` > `:cfdo %s/old/new/g | update` - search and replace for all files
      - `:e ++ff=dos` - convert `^M` to unix line ending
      - `gc` - comment / uncomment
      - `//` - clear search result
      - `%` - jump to closing tag
      - `<\-p>` - prettify
      - `<\-f>` - eslint autofix

### Shell overrides

These shadow the real commands — see `zsh/aliases.zsh` for the full list.

- `ls`, `ll` - eza
- `cat` - bat
- `find` - fd
- `ping` - prettyping
- `top` - glances
- `netstat` - rustnet
- `man` - tldr
- `df` - duf
- `du` - top 10 largest, depth 2
- `z` - cd to a folder using fuzzy search
- `ctrl+r` - fuzzy search for used commands
- `ports` - list listening ports
- `icloud` - navigate to the iCloud directory
- Prefix any override with `old` for the original (`oldcat`, `oldfind`)

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'flazz/vim-colorschemes'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'

Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tomtom/tcomment_vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'css', 'scss', 'json', 'markdown'] }

call plug#end()

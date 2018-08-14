call plug#begin('~/.vim/plugged')

" Default
Plug 'tpope/vim-sensible'
Plug 'flazz/vim-colorschemes'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Search
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': './install --all' }

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ryanoasis/vim-devicons'

" Editing
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'digitaltoad/vim-pug'
Plug 'vim-syntastic/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Valloric/YouCompleteMe', {
  \ 'do': './install.py --tern-completer' }
Plug 'ternjs/tern_for_vim', {
  \ 'do': 'yarn install' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'css', 'scss', 'json', 'markdown'] }

call plug#end()

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
Plug 'Xuyuanp/nerdtree-git-plugin'

" Editing
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'digitaltoad/vim-pug'
Plug 'vim-syntastic/syntastic', { 'do': 'yarn global add sass-lint' }
Plug 'mattn/emmet-vim'
Plug 'tpai/vim-react-snips'
Plug 'SirVer/ultisnips'
Plug 'tomtom/tcomment_vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'css', 'scss', 'json', 'markdown'] }

call plug#end()

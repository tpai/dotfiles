local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')

-- Default
Plug ('catppuccin/nvim', { ['as'] = 'catppuccin' })
Plug ('tpope/vim-sensible')
Plug ('flazz/vim-colorschemes')
Plug ('terryma/vim-multiple-cursors')
Plug ('christoomey/vim-tmux-navigator')

-- Git
Plug ('tpope/vim-fugitive')
Plug ('junegunn/gv.vim')
Plug ('airblade/vim-gitgutter')

-- Search
Plug ('ctrlpvim/ctrlp.vim')
Plug ('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })
Plug ('junegunn/fzf.vim')

-- NERDTree
Plug ('scrooloose/nerdtree')
Plug ('jistr/vim-nerdtree-tabs')
Plug ('ryanoasis/vim-devicons')
Plug ('Xuyuanp/nerdtree-git-plugin')

-- Syntax Highlighting
Plug ('pangloss/vim-javascript')
Plug ('leafgarland/typescript-vim')
Plug ('maxmellon/vim-jsx-pretty')
Plug ('digitaltoad/vim-pug')
Plug ('stephpy/vim-yaml')
Plug ('towolf/vim-helm')
Plug ('vim-python/python-syntax')
Plug ('posva/vim-vue')
Plug ('plasticboy/vim-markdown')
Plug ('jxnblk/vim-mdx-js')
Plug ('ap/vim-css-color')
Plug ('tomlion/vim-solidity')
Plug ('hashivim/vim-hashicorp-tools', { ['do'] = 'sh ./assemble.sh' })

-- Editing
Plug ('neoclide/coc.nvim', { ['branch'] = 'release', ['do'] = ':CocInstall coc-tabnine coc-tsserver coc-eslint coc-vetur coc-stylelint coc-json coc-html coc-css coc-sh coc-pyright' })
Plug ('iamcco/coc-tailwindcss',  { ['do'] = 'yarn install --frozen-lockfile && yarn run build' })
Plug ('tpai/coc-yaml',  { ['do'] = 'yarn install --frozen-lockfile' })
Plug ('tpai/vim-prettier', { ['do'] = 'yarn install --frozen-lockfile', ['for'] = {'javascript', 'typescript', 'css', 'scss', 'json', 'vue', 'yaml', 'html', 'sh', 'conf'} })
Plug ('editorconfig/editorconfig-vim')
Plug ('honza/vim-snippets')
Plug ('tomtom/tcomment_vim')
Plug ('AndrewRadev/splitjoin.vim')
Plug ('junegunn/vim-easy-align')
Plug ('Oldenborg/vim-px-to-rem')
Plug ('heavenshell/vim-jsdoc', { ['for'] = {'javascript', 'javascript.jsx','typescript'}, ['do'] = 'make install' })
Plug ('nicwest/vim-camelsnek')
Plug ('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && yarn install' })
Plug ('github/copilot.vim')
Plug ('robitx/gp.nvim')

vim.call('plug#end')

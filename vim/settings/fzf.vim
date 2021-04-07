command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --type-add "lockfiles:{Gemfile,yarn}.lock" -T lockfiles -T svg --glob="!.git/*" --hidden --color=never --column --line-number --no-heading --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(),
  \   <bang>0)

" map ,ag to RipGrep
nmap <silent> ,ag :Rg<CR>

" map ,t to FZF (find files with RG and ignore unnecessary files)
nmap <silent> ,t :call fzf#run({
  \  'sink':   'e',
  \  'source': "rg --type-add 'lockfiles:{Gemfile,yarn}.lock' -T lockfiles -T svg --glob='\!.git/*' --hidden --files",
  \  'down':   '40%'
  \ })<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --type-add "lockfiles:{Gemfile,yarn}.lock" --type-add "test:*.{spec,test}.*" -T lockfiles -T test -T svg --color=never --column --line-number --no-heading --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(),
  \   <bang>0)

" map ,ag to Ag with FZF
nmap <silent> ,ag :Rg<CR>

" map ,t to FZF
nmap <silent> ,t :call fzf#run({
  \  'sink':   'e',
  \  'source': "rg --type-add 'lockfiles:{Gemfile,yarn}.lock' --type-add 'test:*.{spec,test}.*' -T lockfiles -T test -T svg --files",
  \  'down':   '40%'
  \ })<CR>

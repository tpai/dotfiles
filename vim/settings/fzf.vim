" map ,t to default fuzzy finder
nnoremap <silent> ,t :call fzf#run({
      \  'sink':   'e',
      \  'source': "ag -g \"\"",
      \  'down':   '40%'
      \ })<CR>

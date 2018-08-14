" map ,t to FZF
nmap <silent> ,t :call fzf#run({
      \  'sink':   'e',
      \  'source': "ag -g \"\"",
      \  'down':   '40%'
      \ })<CR>

" map ,t to default fuzzy finder
nnoremap <silent> ,t :call fzf#run({ 'sink': 'e', 'down': '40%' })<CR>

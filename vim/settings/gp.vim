" all mode: stop generating
noremap <silent> ,K :GpStop<cr>

" normal mode: open a popup
nnoremap <silent> ,p :GpPopup<cr>

" normal mode: append
nnoremap <silent> ,k :GpAppend<cr>

" visual mode: rewrite
xnoremap <silent> ,k :GpRewrite<cr>

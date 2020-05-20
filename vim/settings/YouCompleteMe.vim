" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_enable_diagnostic_highlighting = 0

" Don't show YCM's preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

nnoremap <silent> ,jd :YcmCompleter GoTo<CR>
nnoremap <silent> ,jr :YcmCompleter GoToReferences<CR>

" Fix warning
if has('python3')
  silent! python3 1
endif

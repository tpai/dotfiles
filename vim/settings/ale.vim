" Only lint the files which be specified
let g:ale_linters_explicit = 1

" Define linters
augroup TypeJavaScriptLint
  au!
  au FileType vue let g:ale_linters =
        \{
        \'vue': ['eslint']
        \}
  au FileType javascript let g:ale_linters =
        \{
        \'javascript': ['eslint']
        \}
  au FileType javascriptreact let g:ale_linters =
        \{
        \'javascriptreact': ['eslint']
        \}
  au FileType typescript let g:ale_linters =
        \{
        \'typescript': ['eslint', 'tsserver']
        \}
  au FileType typescriptreact let g:ale_linters =
        \{
        \'typescriptreact': ['eslint', 'tsserver']
        \}
augroup END

" Define fixers
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'javascript': ['prettier', 'eslint'],
  \   'javascriptreact': ['prettier', 'eslint'],
  \   'typescript': ['prettier', 'eslint'],
  \   'typescriptreact': ['prettier', 'eslint'],
  \   'css': ['prettier'],
  \   'scss': ['prettier'],
  \}

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" Open error list
let g:ale_open_list = 1
let g:ale_list_window_size = 5

" Manual fix
nmap \\ <Plug>(ale_fix)

" Navigate between errors
nmap <silent> ek <Plug>(ale_previous_wrap)
nmap <silent> ej <Plug>(ale_next_wrap)

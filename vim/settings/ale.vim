" Only lint the files which be specified
let g:ale_linters_explicit = 1

" Define linters
augroup TypeJavaScriptLint
  au!
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

" Fix file while save
let g:ale_fix_on_save = 1

" Manual fix
nmap \\ <Plug>(ale_fix)

" Open error list
let g:ale_open_list = 1

" Navigate between errors
nmap <silent> ek <Plug>(ale_previous_wrap)
nmap <silent> ej <Plug>(ale_next_wrap)

" Add common options
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=1
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_messages={'level': 'warnings'}

" Enable eslint checker
" https://github.com/vim-syntastic/syntastic/issues/1692#issuecomment-350153207
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_generic=1
let g:syntastic_javascript_eslint_exec='/bin/ls'
let g:syntastic_javascript_eslint_exe='$((test -f $(npm bin)/eslint && echo "$(npm bin)/eslint") || (test -f $(npm root)/eslint/bin/eslint.js && echo "$(npm root)/eslint/bin/eslint.js") || (test -f $(which eslint) && echo "$(which eslint)"))'
let g:syntastic_javascript_eslint_args='-f compact'
let g:syntastic_vue_checkers=['javascript/eslint']

" Enable scss checker
let g:syntastic_scss_checkers=['sass_lint']

" Enable typescript checker
let g:tsuquyomi_disable_quickfix=1
let g:syntastic_typescript_checkers=['tsuquyomi'] " You shouldn't use 'tsc' checker.

" Ignore html tidy checker errors for typescript
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

" Debug Mode
let g:syntastic_debug=0

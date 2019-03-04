"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=1
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_messages={'level': 'warnings'}

" Enable the eslint checker
" https://github.com/vim-syntastic/syntastic/issues/1692#issuecomment-350153207
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_generic=1
let g:syntastic_javascript_eslint_exec='/bin/ls'
let g:syntastic_javascript_eslint_exe='$((test -f $(npm bin)/eslint && echo "$(npm bin)/eslint") || (test -f $(npm root)/eslint/bin/eslint.js && echo "$(npm root)/eslint/bin/eslint.js") || (test -f $(which eslint) && echo "$(which eslint)"))'
let g:syntastic_javascript_eslint_args='-f compact'

" Enable the scss checker
let g:syntastic_scss_checkers=['sass_lint']

" Debug Mode
let g:syntastic_debug = 0

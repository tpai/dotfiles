" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Execute eslint autofix
nmap <leader>f :CocCommand eslint.executeAutofix<cr>

" Navigate diagnostics
nmap <silent> ek <Plug>(coc-diagnostic-prev)
nmap <silent> ej <Plug>(coc-diagnostic-next)

" Code navigation
nmap <silent> ,jd <Plug>(coc-definition)
nmap <silent> ,jr <Plug>(coc-references)

" Scroll in float
nnoremap <silent><expr> <s-j> coc#float#has_scroll() ? coc#float#scroll(1, 1) : "\<s-j>"
nnoremap <silent><expr> <s-k> coc#float#has_scroll() ? coc#float#scroll(0, 1) : "\<s-k>"

" Symbol renaming
nmap <silent> ,rn <Plug>(coc-rename)

" File renaming
nmap <silent> ,rf :CocCommand workspace.renameCurrentFile<cr>

" Show code action dialog
nmap <silent> ,ac <Plug>(coc-codeaction)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Show snippets
nnoremap <silent><nowait> <space>sn :CocList snippets<CR>

" Show documentation in preview window.
nnoremap <silent> ,df :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

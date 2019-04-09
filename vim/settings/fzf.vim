function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --type-add "lockfiles:{Gemfile,yarn}.lock" --type-add "test:*.{spec,test}.*" -T lockfiles -T test -T svg --color=never --column --line-number --no-heading --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" map ,ag to Ag with FZF
nmap <silent> ,ag :Rg<CR>

" map ,t to FZF
nmap <silent> ,t :call fzf#run({
  \  'sink':   'e',
  \  'source': "rg --type-add 'lockfiles:{Gemfile,yarn}.lock' --type-add 'test:*.{spec,test}.*' -T lockfiles -T test -T svg --files",
  \  'down':   '40%'
  \ })<CR>

" Only allow HTML, JS and CSS preprocessor to reduce the cost.
let g:vue_pre_processors = []

" Sync syntax when vue file loaded, page up and page down.
autocmd FileType vue syntax sync fromstart
autocmd CursorMoved * :syntax sync fromstart
autocmd CursorMovedI * :syntax sync fromstart

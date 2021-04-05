" ================ File Navigation Configs ====================

" nerdtree
let g:netrw_banner = 0
let g:NERDTreeWinSize = 50
map <C-n> :NERDTreeToggle<CR>
map <C-k> :NERDTreeFind<CR>

let g:NERDTreeHijackNetrw=0
let g:NERDTreeStatusline = '%#NonText#'
let NERDTreeIgnore=['\.o$', '\~$', 'node_modules', 'cypress/data', 'dist', '^tmp$[[dir]]']

" Switch to previously opened file
map <C-\> :e#<CR>
imap <C-\> :e#<CR>

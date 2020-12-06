" ================ Autocomplete Configs ====================
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-solargraph', 'coc-tailwindcss', 'coc-sql', 'coc-json', 'coc-tailwindcss', 'coc-yaml', 'coc-eslint' ]

" TextEdit might fail if hidden is not set.
set hidden
"
" Give more space for displaying messages.
set cmdheight=2

" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=300
"
" " Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


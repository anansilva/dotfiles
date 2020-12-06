" ================ Visuals Config ====================

syntax on
set background=dark
let g:gruvbox_contrast_light=1
let g:gruvbox_italic=1
colorscheme gruvbox

" ligtline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ] ]
      \ },
      \ }
let g:lightline.component = { 'close': '' }


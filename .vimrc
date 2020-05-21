set nocompatible              " required by vundle
filetype off                  " required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" theme and visuals
Plugin 'morhetz/gruvbox'
Plugin 'itchyny/lightline.vim'
Plugin 'mengelbrecht/lightline-bufferline'

" ruby/rails
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

" misc
Plugin 'tpope/vim-surround'   "ci || cs || ds || yss to edit surroundings
Plugin 'tpope/vim-commentary' "gcc or gc+motion to comment code
Plugin 'tpope/vim-fugitive'   "check git history
Plugin 'tpope/vim-unimpaired' "key combinations for fugitive

" search
" Plugin 'wsdjeg/FlyGrep.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'

" testing
Plugin 'janko/vim-test'
Plugin 'benmills/vimux'


" ignore directories
set wildignore+=*/tmp/*,*/node_modules/*,*.sql,*/dist/*,*/vendor/bundle/*
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable built-in matchit plugin
runtime macros/matchit.vim

" Put your non-Plugin stuff after this line

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


" ================ General Config ====================

set number                      "Line numbers
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set autoindent
set ruler                       " show the cursor position all the time
set nowrap                      " Don't wrap long lines
set textwidth=80
set colorcolumn=80
set undofile
set ttyfast
set title
set laststatus=2                " Always display the status line
set cursorline
set relativenumber

" indentation
set expandtab
set shiftwidth=2
set tabstop=2                   " Two spaces for tabs everywhere

" backup files (turn off)
set nobackup
set nowritebackup
set noswapfile

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" Bind capital letters to the corresponding non-capital letters
command! Q q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

" block arrow keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" avoid accidentaly leaving vim
nnoremap Z <Nop>
nnoremap ZZ <Nop>

" ignore directories
set wildignore+=*/tmp/*,*/node_modules/*,*.sql,*/dist/*,*/vendor/bundle/*

"other files
au BufNewFile,BufRead *.prawn set filetype=ruby

" ================ Save Configs ====================

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

"remove spaces when saving
autocmd BufWritePre * :%s/\s\+$//e
" 2 spaced tabs
autocmd filetype ruby :setlocal sw=2 ts=2 sts=2
" Allow comments in all files
autocmd FileType apache setlocal commentstring=#\ %s


" ================ Leader Configs ====================

let mapleader = ","


" ================ Tests' Configs ====================

" run tests in a tmux terminal
" let test#ruby#rspec#executable = 'spring rspec'
let test#ruby#rspec#executable = 'bundle exec rspec'
let test#ruby#use_spring_binstub = 1


" ================ Search Configs ====================

" nerdtree
let g:netrw_banner = 0
let g:NERDTreeWinSize = 50
map <C-n> :NERDTreeToggle<CR>
map <C-k> :NERDTreeFind<CR>

let g:NERDTreeHijackNetrw=0
let g:NERDTreeStatusline = '%#NonText#'
let NERDTreeIgnore=['\.o$', '\~$', 'node_modules', 'cypress/data', 'dist', 'tmp']

"rg
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%m
endif

" fzf
let rgignore = '**/node_modules/*,**/.git/*,**/vendor/assets/*,**/vendor/bundle/*,**/public/assets/*,**/public/packs/*,**/public/fonts/*,*.sql,*.csv,*.log,**/.keep,*.json'

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --hidden --follow --no-heading --color=always --smart-case --glob "!{rgignore}" -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

command! -bang -nargs=? -complete=dir Files
			                  \ call fzf#run(fzf#wrap({'source': 'rg --files --hidden --follow', 'down': '40%'}))

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :RG<CR>

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default


" ================ File Navigation Configs ====================

" Switch to previously opened file
map <C-\> :e#<CR>
imap <C-\> :e#<CR>

" ================ Git Configs ====================

" git commit message
autocmd FileType gitcommit set colorcolumn=73
autocmd FileType gitcommit set textwidth=72

" ================ Misc Custom Bindings ====================
"Toggle ruby blocks
map <Leader>ob 0f{cwdo<CR><esc>A<BS><CR>end<esc>
map <Leader>cb 0$bcw{<esc><S-j><S-j>cw}<esc>

"Adds pry on line bellow
map <Leader>b obinding.pry<esc>:w<cr>

"paste
noremap <leader>sp :set paste<CR>
noremap <leader>snp :set nopaste<CR>

"clean search highlight
noremap <leader>z :nohl<CR>

"tests
map <silent> <leader>tf :TestFile -strategy=vimux<CR>
map <silent> <leader>tn :TestNearest -strategy=vimux<CR>
map <silent> <leader>tl :TestLast -strategy=vimux<CR>

map <leader>gl :0Glog<CR>
map <leader>gb :Gblame<CR>

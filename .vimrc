set nocompatible              " required by vundle
filetype off                  " required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" theme
Plugin 'morhetz/gruvbox'

" rails plugins
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'janko/vim-test'
Plugin 'benmills/vimux'
Plugin 'wsdjeg/FlyGrep.vim'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
syntax on
set background=dark

" Enable built-in matchit plugin
runtime macros/matchit.vim
" ================

let mapleader = ","

map <Leader>o 0f{cwdo<CR><esc>A<BS><CR>end<esc>
map <Leader>j 0$bcw{<esc><S-j><S-j>cw}<esc>

let g:gruvbox_contrast_light=1
let g:gruvbox_italic=1
colorscheme gruvbox

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

map <Leader>b obinding.pry<esc>:w<cr>

" run tests in a tmux terminal
" ctrl + l runs the whole file
" ctrl + h runs the cursor line
let test#ruby#rspec#executable = 'bundle exec rspec'
let test#ruby#use_spring_binstub = 1
map <silent> <C-l> :TestFile -strategy=vimux<CR>
map <silent> <C-h> :TestNearest -strategy=vimux<CR>
map <silent> <C-@> :FlyGrep<CR>

" Switch to previously opened file
map <C-\> :e#<CR>
imap <C-\> :e#<CR>

" block arrow keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" nerdtree
let g:netrw_banner = 0
"let g:netrw_liststyle=3
"let g:netrw_list_hide= '.*\.beam$'
let g:NERDTreeWinSize = 30
map <C-n> :NERDTreeToggle<CR>
map <C-k> :NERDTreeFind<CR>
let g:NERDTreeHijackNetrw=0
let NERDTreeIgnore=['\.o$', '\~$', 'node_modules', 'cypress/data', 'dist']

command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

set number
set autoindent
set history=1000
set ruler
set nowrap
set textwidth=80
set colorcolumn=80
set nobackup
set noswapfile
set undofile
set ttyfast
set title
set laststatus=2
set cursorline

"remove spaces when saving
autocmd BufWritePre * :%s/\s\+$//e
" 2 spaced tabs
autocmd filetype ruby :setlocal sw=2 ts=2 sts=2

" ctrlp configs
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0

" git commit message
autocmd FileType gitcommit set colorcolumn=73
autocmd FileType gitcommit set textwidth=72

" ignore directories
set wildignore+=*/tmp/*,*/node_modules/*,*.sql,*/dist/*,*/vendor/bundle/*

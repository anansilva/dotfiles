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
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'takac/vim-hardtime'
Plugin 'tpope/vim-unimpaired'
Plugin 'bkad/camelcasemotion'

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

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

" run tests in a tmux terminal
" ctrl + l runs the whole file
" ctrl + h runs the cursor line
let test#ruby#rspec#executable = 'spring rspec'
" let test#ruby#rspec#executable = 'bundle exec rspec'
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

" avoid accidentaly leaving vim
nnoremap Z <Nop>
nnoremap ZZ <Nop>

" nerdtree
let g:netrw_banner = 0
"let g:netrw_liststyle=3
"let g:netrw_list_hide= '.*\.beam$'
let g:NERDTreeWinSize = 50
map <C-n> :NERDTreeToggle<CR>
map <C-k> :NERDTreeFind<CR>
let g:NERDTreeHijackNetrw=0
let NERDTreeIgnore=['\.o$', '\~$', 'node_modules', 'cypress/data', 'dist', 'tmp']

" camelcasemotion
let g:camelcasemotion_key = '<leader>'

command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

set autoread	" Auto reload changed files
set number 		" Enable line numbers
set autoindent
set history=1000
set ruler  " show the cursor position all the time
set nowrap " Don't wrap long lines
set textwidth=80
set colorcolumn=80
set nobackup nowritebackup noswapfile " Turn off backup files
set undofile
set ttyfast
set title
set laststatus=2 " Always display the status line
set cursorline
set expandtab shiftwidth=2 tabstop=2  " Two spaces for tabs everywhere
set relativenumber

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

"remove spaces when saving
autocmd BufWritePre * :%s/\s\+$//e
" 2 spaced tabs
autocmd filetype ruby :setlocal sw=2 ts=2 sts=2
" Allow comments in all files
autocmd FileType apache setlocal commentstring=#\ %s


" ctrlp configs
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|tmp\|vendor\|dist\'

" git commit message
autocmd FileType gitcommit set colorcolumn=73
autocmd FileType gitcommit set textwidth=72

" ignore directories
set wildignore+=*/tmp/*,*/node_modules/*,*.sql,*/dist/*,*/vendor/bundle/*

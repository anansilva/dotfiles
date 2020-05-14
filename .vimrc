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

" ruby/rails
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

" misc
Plugin 'tpope/vim-surround'   "ci || cs || ds || yss to edit surroundings
Plugin 'tpope/vim-commentary' "gcc or gc+motion to comment code
Plugin 'tpope/vim-fugitive'   "check git history
Plugin 'tpope/vim-unimpaired' "key combinations for fugitive

" finders
Plugin 'wsdjeg/FlyGrep.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

" testing
Plugin 'janko/vim-test'
Plugin 'benmills/vimux'

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

"Toggle ruby blocks
map <Leader>o 0f{cwdo<CR><esc>A<BS><CR>end<esc>
map <Leader>j 0$bcw{<esc><S-j><S-j>cw}<esc>

"Adds binding pry to the line below the cursor
map <Leader>b obinding.pry<esc>:w<cr>


" ================ Tests' Configs ====================

" run tests in a tmux terminal
" let test#ruby#rspec#executable = 'spring rspec'
let test#ruby#rspec#executable = 'bundle exec rspec'
let test#ruby#use_spring_binstub = 1
" ctrl + l runs the whole file
map <silent> <C-l> :TestFile -strategy=vimux<CR>
" ctrl + h runs the cursor line
map <silent> <C-h> :TestNearest -strategy=vimux<CR>


" ================ Finders' Configs ====================

" nerdtree
let g:netrw_banner = 0
let g:NERDTreeWinSize = 50
map <C-n> :NERDTreeToggle<CR>
map <C-k> :NERDTreeFind<CR>
let g:NERDTreeHijackNetrw=0
let NERDTreeIgnore=['\.o$', '\~$', 'node_modules', 'cypress/data', 'dist', 'tmp']

" flygrep
map <silent> <C-@> :FlyGrep<CR>

" ctrlp
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|tmp\|vendor\|dist\'

" Switch to previously opened file
map <C-\> :e#<CR>
imap <C-\> :e#<CR>


" ================ Git Configs ====================

" git commit message
autocmd FileType gitcommit set colorcolumn=73
autocmd FileType gitcommit set textwidth=72

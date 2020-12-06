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

" javascript and typescript
Plugin 'pangloss/vim-javascript'    " JavaScript support
Plugin 'leafgarland/typescript-vim' " TypeScript syntax
Plugin 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

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

" autocomplete
Plugin 'neoclide/coc.nvim' , { 'branch' : 'release' }

" testing
Plugin 'janko/vim-test'
Plugin 'benmills/vimux'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable built-in matchit plugin
runtime macros/matchit.vim

" Put your non-Plugin stuff after this line

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
au BufNewFile,BufRead *.ts set filetype=typescript


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

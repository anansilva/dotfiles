" ================ Copy Paste Configs ====================
nmap <leader>pbp :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <leader>pbp <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <leader>pby :.w !pbcopy<CR><CR>
vmap <leader>pby :w !pbcopy<CR><CR>

"paste
noremap <leader>sp :set paste<CR>
noremap <leader>snp :set nopaste<CR>



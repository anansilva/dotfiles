function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*.vim'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
        execute 'source' config_file
    endif
  endfor
endfunction
"
" ================ Leader Configs ====================

let mapleader = ","

" ================ Git Configs ====================

" git commit message
autocmd FileType gitcommit set colorcolumn=73
autocmd FileType gitcommit set textwidth=72

"git
map <leader>gl :0Glog<CR>
map <leader>gb :Gblame<CR>

" ================ Search Configs ====================

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
"
"clean search highlight
noremap <leader>z :nohl<CR>


"The custom :Qargs command sets the arglist to contain each of the files referenced by the quickfix list (vimgrep)
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction


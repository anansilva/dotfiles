" ================ Tests' Configs ====================

" run tests in a tmux terminal
let test#ruby#rspec#executable = 'bundle exec rspec'
let test#ruby#use_spring_binstub = 1

"tests
map <silent> <C-j> :TestFile -strategy=vimux<CR>
map <silent> <C-h> :TestNearest -strategy=vimux<CR>
map <silent> <C-l> :TestLast -strategy=vimux<CR>
map <leader>a :A<CR>

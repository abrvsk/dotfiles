" Remap leader to spacebar
nnoremap <Space> <Nop>
let mapleader=" "

" open splits with pipe and min
nnoremap <silent> \ :vsplit<cr>
nnoremap <silent> - :split<cr>

" remap leader related commands
nnoremap <silent> <leader>w :w<cr> :e<cr>
nnoremap <silent> <leader>c :q<cr>

" turn off search highlighting
nnoremap <silent> <leader>nh :nohl<cr>

" split movement
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

" define line highlight color
highlight LineHighlight ctermbg=black guibg=black
nmap <silent> <leader>l :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
vmap <silent> <leader>l :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
nmap <silent> <leader>o :call clearmatches()<CR>

" jump between buffers
nmap <silent> <leader>] :bnext<cr>
nmap <silent> <leader>[ :bprev<cr>

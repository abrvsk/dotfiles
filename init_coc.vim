" Install plugins
if empty(glob("~/.vim/autoload/plug.vim"))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  auto VimEnter * PlugInstall
endif
call plug#begin('~/.vim/plugged')

" completion engine
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Add some colours
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" visualize indent
Plug 'Yggdroot/indentLine'

" Comment/uncomment with 'gc[motion]'
Plug 'tpope/vim-commentary'

" statusline
Plug 'vim-airline/vim-airline'

" fast movement in buffers
Plug 'bounceme/poppy.vim'
au! cursormoved * call PoppyInit()

Plug 'justinmk/vim-sneak'

" fuzzy finder
Plug '/usr/local/opt/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" async term commands from vim
Plug 'tpope/vim-dispatch'

" awesome git manager!
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'sodapopcan/vim-twiggy'
Plug 'airblade/vim-gitgutter'

" jest coverage
" Plug 'ruanyl/coverage.vim'

call plug#end()

syntax enable
" colorscheme onedark

hi UncoveredLine guifg=#ffaa00 guibg=#ffaa00

" let g:gruvbox_material_background = 'hard'
" colorscheme gruvbox-material
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_bold = 0
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1

" enable mouse in all modes
set mouse=a

" show hidden symbols
set list
set listchars=eol:⏎,nbsp:·

" Disable old vi style
set nocompatible
set background=dark

set cursorline
set hidden
set switchbuf=usetab,newtab
set splitright

" always show sign column
set scl=yes

" automatically update swap if file was changed
set autoread
au CursorHold * checktime

" Better display for messages
set cmdheight=1
set showcmd
set clipboard=unnamed

" set ZSH as default shell
set shell=/bin/zsh

" automatically change to already open swap
set title titlestring=

" Indentation
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set number
filetype indent on
filetype plugin on
" overwrite default indenting sign
let g:indentLine_char_list = ['⎸', '|', '¦', '┆', '┊']

set path+=** 		" native vim fuzzy file finder
set wildmenu 		" visual autocomplete for command menu
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set noautochdir         " root as working directory no matter how deep I am

" highlight ColorColumn ctermbg=Magenta
set colorcolumn=81
" define line highlight color
highlight LineHighlight ctermbg=black guibg=black
nmap <silent> <leader>l :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
vmap <silent> <leader>l :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>
nmap <silent> <leader>o :call clearmatches()<CR>

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Make all swap files be saved in a temp directory instead of working one
set directory^=$HOME/.vim/tmp/

" open netrw with Ctrl+E
nnoremap <silent> <C-e> :Explore<cr>

" Show all diagnostics
nnoremap <silent> <leader>d  :<C-u>CocList diagnostics<cr>
nmap <silent> <leader>a  <Plug>(coc-codeaction)
nmap <silent> <leader>qf  <Plug>(coc-fix-current)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <leader>k <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>j <Plug>(coc-diagnostic-next)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

" autoimport vars
inoremap <silent><expr> <cr>
      \ pumvisible() ? coc#_select_confirm() :
      \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Completion with <TAB>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<cr>'

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
nnoremap <silent> <leader>or :OR<cr>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Highlight uncovered lines
function! LightlineCocCoverageStatus() abort
  let status = get(g:, 'coc_coverage_lines_pct', '')
  if empty(status)
    return ''
  endif

  return '☂ ' . status . '% Lines Covered'
endfunction

let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'readonly', 'filename' ]
  \   ],
  \   'right':[
  \     [ 'coccoverage', 'lineinfo', 'percent', 'cocstatus' ],
  \     [ 'cocapollo' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'coccoverage': 'LightlineCocCoverageStatus'
  \ }
\ }

command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart

" TreeSitter modules
" syntax highlighting
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
EOF

" airline
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_inactive_collapse = 1

" disable sections
let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''

" Easymotion
let g:EasyMotion_do_mapping=0

" sneak motion
let g:sneak#label = 1

" add extended matching for % (shift+5)
packadd! matchit
:let b:match_skip = 's:comment\|string'

" ignore folders by netrw
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_list_stile=3
let g:netrw_ctags="ctags"
let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,node_modules,^\.\.\=/\=$'

" Enable true colors in terminal
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Remap leader to spacebar
nnoremap <Space> <Nop>
let mapleader=" "

" open splits with pipe and min
nnoremap <silent> \ :vsplit<cr>
nnoremap <silent> - :split<cr>

" remap leader related commands
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>c :q<cr>

" fugitive git remaps
nnoremap <silent> <leader>g :G<cr> :Twiggy<cr>
nnoremap <silent> <leader>tg :Twiggy<cr>
nnoremap <silent> <leader>b :Git blame<cr>
nnoremap <silent> <leader>u :Git remote update origin --prune<cr>

" Prettier
nnoremap <silent> <leader>p :CocCommand prettier.formatFile<cr>

" turn off search highlighting
nnoremap <silent> <leader>nh :nohl<cr>

" split movement
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

" jump between buffers
nmap <silent> <leader>] :bnext<cr>
nmap <silent> <leader>[ :bprev<cr>

" start fzf with Ctrl+P for git files
nnoremap <silent> <C-p> :GFiles<cr>
" start fzf with Ctrl+S for grep
nnoremap <silent> <C-s> :Ag<cr>
command! -bang -nargs=? -complete=dir GFiles
    \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

" start fzf with Ctrl+f for all files
nnoremap <silent> <C-f> :Files<cr>
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)

" " coverage config
" let g:coverage_json_report_path = 'coverage/coverage-final.json'
" let g:coverage_sign_covered = '⦿'
" let g:coverage_sign_uncovered = '∆'
" let g:coverage_interval = 3000
" let g:coverage_show_covered = 1
" let g:coverage_show_uncovered = 1

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

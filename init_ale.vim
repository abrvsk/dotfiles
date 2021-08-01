" Install plugins
if empty(glob("~/.vim/autoload/plug.vim"))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  auto VimEnter * PlugInstall
endif
call plug#begin('~/.vim/plugged')

" completion engine
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" Linting engine
Plug 'dense-analysis/ale'

" prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'jiangmiao/auto-pairs'

" JS highght for onedark
Plug 'joshdick/onedark.vim'
" Plug 'luochen1990/rainbow'

" Comment/uncomment with 'gc[motion]'
Plug 'tpope/vim-commentary'

" Improved syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" statusline
Plug 'vim-airline/vim-airline'
" easymotion
Plug 'easymotion/vim-easymotion'

" fuzzy finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" awesome git manager!
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'sodapopcan/vim-twiggy'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Ale config
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_open_list = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 1
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_delay = 10
let g:airline#extensions#ale#enabled = 1
" quick jump between errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Deoplete confi
let g:deoplete#enable_at_startup = 1

syntax enable
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
" Disable old vi style
set nocompatible
" Indentation
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set number
filetype indent on
filetype plugin on
set path+=** 		" native vim fuzzy file finder
set wildmenu 		" visual autocomplete for command menu
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set noautochdir         " root as working directory no matter how deep I am

highlight ColorColumn ctermbg=Magenta
set colorcolumn=81

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Make all swap files be saved in a temp directory instead of working one
set directory^=$HOME/.vim/tmp/

" open netrw with Ctrl+E
nnoremap <silent> <C-e> :Explore<cr>

" ignore folders by netrw
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_list_stile=3
let g:netrw_ctags="ctags"
let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,node_modules,^\.\.\=/\=$'

" start fzf with Ctrl+P for git files
nnoremap <silent> <C-p> :GFiles<cr>
" start fzf with Ctrl+S for grep
nnoremap <silent> <C-s> :Ag<cr>

" Create 'tags' file
command! MakeTags !ctags -R

colorscheme onedark

" rainbow brackets
let g:rainbow_active = 1

" Remap leader to spacebar
nnoremap <Space> <Nop>
let mapleader=" "
" Easymotion
let g:EasyMotion_do_mapping=0
map <leader><leader> <Plug>(easymotion-bd-w)
" open splits with pipe and min
nnoremap <silent> \ :vsplit<cr>
nnoremap <silent> - :split<cr>
" remap leader related commands
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>c :q<cr>
" fugitive git remaps
nnoremap <silent> <leader>g :G<cr>
nnoremap <silent> <leader>tg :Twiggy<cr>
nnoremap <silent> <leader>b :Gblame<cr>
" Prettier
nnoremap <silent> <leader>p :CocCommand prettier.formatFile<cr>
" turn off search highlighting
nnoremap <silent> <leader>nh :nohl<cr>

" split movement
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" remap go definition
nmap <silent> gd :ALEGoToDefinition<cr>
nmap <silent> gr :ALEFindReferences<cr>
nmap <silent> gn :ALERename<cr>

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

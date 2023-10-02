syntax enable
syntax sync fromstart

set background=dark
set cursorline
set hidden
set switchbuf=usetab,newtab
set splitright
set splitbelow
set path+=** 		" native vim fuzzy file finder
set wildmenu 		" visual autocomplete for command menu
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set noautochdir         " root as working directory no matter how deep I am

" add extended matching for % (shift+5)
packadd! matchit
:let b:match_skip = 's:comment\|string'

" always show sign column
set scl=yes

" automatically update swap if file was changed
set autoread
au CursorHold * checktime
" automatically change to already open swap
set title titlestring=
" Make all swap files be saved in a temp directory instead of working one
set directory^=$HOME/.vim/tmp/

" Better display for messages
set cmdheight=1
set showcmd
set clipboard=unnamed

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" controls timeout of popups for WhickKey and stuff
" set timeoutlen=300

" set ZSH as default shell
set shell=/bin/zsh

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

" show hidden symbols
set list
set listchars=eol:⏎,nbsp:·

" highlight ColorColumn ctermbg=Magenta
set colorcolumn=81

hi UncoveredLine guifg=#ffaa00 guibg=#ffaa00

" enable mouse in all modes
set mouse=a

" Enable true colors in terminal
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


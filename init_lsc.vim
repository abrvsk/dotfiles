" Install plugins
if empty(glob("~/.vim/autoload/plug.vim"))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  auto VimEnter * PlugInstall
endif
call plug#begin('~/.vim/plugged')

" completion engine
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Add some colours
Plug 'sainnhe/sonokai'
Plug 'joshdick/onedark.vim'
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

" fast navigation
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
Plug 'ruanyl/coverage.vim'

call plug#end()

syntax enable
colorscheme sonokai
let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1

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

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Make all swap files be saved in a temp directory instead of working one
set directory^=$HOME/.vim/tmp/

" open netrw with Ctrl+E
nnoremap <silent> <C-e> :Explore<cr>

" compe
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.spell = v:true
let g:compe.source.tags = v:true
let g:compe.source.snippets_nvim = v:true
let g:compe.source.treesitter = v:true
let g:compe.source.omni = v:true

" mappings
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" LSP
lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

" LSP TS server
lua << EOF
require'lspconfig'.tsserver.setup{}
EOF

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

" open splits with pipe and minus
nnoremap <silent> \ :vsplit<cr>
nnoremap <silent> - :split<cr>

" remap leader related commands
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>c :q<cr>

" fugitive git remaps
nnoremap <silent> <leader>g :G<cr> :Twiggy<cr>
nnoremap <silent> <leader>tg :Twiggy<cr>
nnoremap <silent> <leader>b :Gblame<cr>

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

" coverage config
let g:coverage_json_report_path = 'coverage/coverage-final.json'
let g:coverage_sign_covered = '⦿'
let g:coverage_sign_uncovered = '∆'
let g:coverage_interval = 3000
let g:coverage_show_covered = 1
let g:coverage_show_uncovered = 1

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

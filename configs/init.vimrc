" Install plugins
if empty(glob("~/.vim/autoload/plug.vim"))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  auto VimEnter * PlugInstall
endif
call plug#begin('~/.vim/plugged')

" completion engine
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-cmp'
" popup of possible key bindings
Plug 'folke/which-key.nvim'

" dotnet/c#
Plug 'OmniSharp/omnisharp-vim'

" Debug Adapter
Plug 'mfussenegger/nvim-dap'

" Symbols
Plug 'simrat39/symbols-outline.nvim'

" auto pairs like () {} etc
" Plug 'jiangmiao/auto-pairs'

" file fizzy search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'hrsh7th/nvim-compe'

" ts utils
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'glepnir/lspsaga.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

" file fizzy search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" error highlights
" pretty icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'folke/lsp-colors.nvim'

Plug 'jiangmiao/auto-pairs'
" definitions/references
Plug 'pechorin/any-jump.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'nyaml', 'html'],
  \ }

" visualize indent
Plug 'Yggdroot/indentLine'

" Add some colours
Plug 'joshdick/onedark.vim'
Plug 'luochen1990/rainbow'
Plug 'morhetz/gruvbox'

" Comment/uncomment with 'gc[motion]'
Plug 'tpope/vim-commentary'

" async term commands from vim
Plug 'tpope/vim-dispatch'

" Improved syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'tree-sitter/tree-sitter-typescript'
" Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" statusline
Plug 'vim-airline/vim-airline'

" fast movement in buffers

Plug 'justinmk/vim-sneak'

" fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }

" awesome git manager!
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'sodapopcan/vim-twiggy'
Plug 'airblade/vim-gitgutter'
Plug 'rbong/vim-flog'

" jest coverage
Plug 'ruanyl/coverage.vim'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" LaTeX
Plug 'lervag/vimtex'

" infinite undo history
Plug 'mbbill/undotree'

call plug#end()

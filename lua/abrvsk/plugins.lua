-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- colorscheme
    use({
        "ellisonleao/gruvbox.nvim",
        as = "gruvbox",
        config = function()
            vim.cmd('colorscheme gruvbox')
        end
    })

    -- rainbow brackets
    use('junegunn/rainbow_parentheses.vim')

    -- pretty icons
    use('kyazdani42/nvim-web-devicons')
    use('folke/trouble.nvim')
    use('folke/lsp-colors.nvim')

    -- Highlight hidden characters: tabs, backspaces etc.
    use('lukas-reineke/indent-blankline.nvim')

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
    }

    use('nvim-treesitter/playground')
    use("nvim-treesitter/nvim-treesitter-context")

    use('theprimeagen/harpoon')

    -- navigate change history
    use('mbbill/undotree')

    -- git stuff
    use('tpope/vim-fugitive')
    use('sodapopcan/vim-twiggy')
    use('airblade/vim-gitgutter')

    -- Twiggy alternative
    use('idanarye/vim-merginal')
    -- needed to improve Merginal rendering
    use('Shougo/vimproc.vim', { run = 'make' })

    -- async term commands from vim
    use('tpope/vim-dispatch')

    -- statusline
    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use('justinmk/vim-sneak')

    -- popup of possible key bindings
    use('folke/which-key.nvim')

    -- Symbols
    use('simrat39/symbols-outline.nvim')

    -- Markdown preview
    use('iamcco/markdown-preview.nvim', { run = 'cd app && yarn install' })

    -- dotnet stuff
    use('OmniSharp/omnisharp-vim')
    use('Hoffs/omnisharp-extended-lsp.nvim')
    use('Decodetalkers/csharpls-extended-lsp.nvim')

    -- for shits and giggles
    use('eandrju/cellular-automaton.nvim')

    use('tpope/vim-commentary')

    -- Adds extra functionality over rust analyzer
    use("simrat39/rust-tools.nvim")

    -- rust stuff
    use("rust-lang/rust.vim")
    use("saecki/crates.nvim")

    -- debugger
    use('mfussenegger/nvim-dap')
end)

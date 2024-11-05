-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            -- { 'v-hp/git-worktree.nvim' }
            { 'theprimeagen/git-worktree.nvim' }
        }
    }

    -- colorscheme
    use({
        "ellisonleao/gruvbox.nvim",
        as = "gruvbox",
    })

    -- rainbow brackets
    use('junegunn/rainbow_parentheses.vim')

    -- pretty icons
    use('kyazdani42/nvim-web-devicons')
    use('folke/lsp-colors.nvim')

    -- Highlight hidden characters: tabs, backspaces etc.
    use('lukas-reineke/indent-blankline.nvim')

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').compilers = { "clang" }
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

    -- async term commands from vim
    use('tpope/vim-dispatch')

    -- statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'MunifTanjim/prettier.nvim' },

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

    -- sneak alternative
    use {
        'smoka7/hop.nvim',
        tag = '*', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup {
                keys = 'etovxqpdygfblzhckisuran',
                case_insensitive = true
            }
        end
    }

    -- popup of possible key bindings
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Symbols
    use('simrat39/symbols-outline.nvim')

    -- Markdown preview
    use('iamcco/markdown-preview.nvim', { run = 'cd app && yarn install' })

    -- dotnet stuff
    use('OmniSharp/omnisharp-vim')
    use('Hoffs/omnisharp-extended-lsp.nvim')

    use('tpope/vim-commentary')

    -- Adds extra functionality over rust analyzer
    use("simrat39/rust-tools.nvim")

    -- rust stuff
    use("rust-lang/rust.vim")
    use("saecki/crates.nvim")

    -- super fast Rust based finder
    -- use('liuchengxu/vim-clap', { run = ':Clap install-binary!' })

    -- debugger
    use('mfussenegger/nvim-dap')

    -- ripgrep (written in Rust, btw)
    use('jremmen/vim-ripgrep')

    -- file explorer
    use({
        'echasnovski/mini.nvim',
        branch = 'main',
    })

    use({ "elixir-tools/elixir-tools.nvim", tag = "stable", requires = { "nvim-lua/plenary.nvim" } })
end)

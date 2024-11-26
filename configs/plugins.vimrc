" NVIM-CMP
" completion engine
set completeopt=menuone,noselect

lua << EOF
-- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })
EOF



" LSPSAGA
" lua << EOF
" local saga = require 'lspsaga'
" saga.init_lsp_saga {
"   max_preview_lines = 40
"   }
" EOF

" default LSP
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent><leader> a     <cmd>lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader> rn    <cmd>lua vim.lsp.buf.rename()<CR>
" nnoremap <silent> g[    <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" nnoremap <silent> g]    <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <leader>or      <cmd>lua vim.lsp.buf.execute_command({command = "_typescript.organizeImports", arguments = {vim.fn.expand("%:p")}})<CR>
command! -nargs=0 OR   :lua vim.lsp.buf.execute_command({command = "_typescript.organizeImports", arguments = {vim.fn.expand("%:p")}})<CR>
nnoremap <silent> <leader>or :OR<cr>

" lsp provider to find the cursor word definition and reference
" open = 'o', vsplit = 's', split = 'i', quit = 'q', scroll_down = '<C-f>', scroll_up = '<C-b>'
" nnoremap <silent>gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

" code action
" nnoremap <silent><leader>a <cmd>lua require('lspsaga.codeaction').code_action()<CR>
" vnoremap <silent><leader>a :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>

" show hover doc
" nnoremap <silent>K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>

" rename
" close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`
" nnoremap <silent><leader>nn <cmd>lua require('lspsaga.rename').rename()<CR>

" preview definition
" nnoremap <silent> gd :Lspsaga preview_definition<CR> // NOT WORKING

" lsp provider to find the cursor word definition and reference
" nnoremap <silent> gr <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

" DIAGNOSTICS
" jump diagnostic
" nnoremap <silent> g] <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" nnoremap <silent> g[ <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
" show diagnostic
" nnoremap <silent><leader>d <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>



" NETRW
" open netrw with Ctrl+E
nnoremap <silent> <C-e> :Explore<cr>

" ignore folders by netrw
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_list_stile=3
let g:netrw_ctags="ctags"
let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,node_modules,^\.\.\=/\=$'



" FZF
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

" Create 'tags' file
command! MakeTags !ctags -R



" SNEAK
" sneak motion
let g:sneak#label = 1



" COLORSCHEME
" colorscheme onedark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_bold = 0
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1



" GIT
" fugitive git remaps
nnoremap <silent> <leader>g :G<cr> :Twiggy<cr>
" nnoremap <silent> <leader>tg :Twiggy<cr>
nnoremap <silent> <leader>b :Git blame<cr>
nnoremap <silent> <leader>u :Git remote update origin --prune<cr>



" PRETTIER
" vim-prettier
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
autocmd BufWrite *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd Filetype typescript,typescriptreact setlocal omnifunc=v:lua.vim.lsp.omnifunc



" TROUBLE
" lua << EOF
" require("trouble").setup {}
" EOF
nnoremap <leader>xx <cmd>TroubleToggle<cr>



" LSP server setup
lua << EOF
local nvim_lsp = require("lspconfig")

-- enable null-ls integration (optional)
-- require("null-ls").config {}
-- require("lspconfig")["null-ls"].setup {
  -- on_attach = on_attach
-- }
-- TreeSitter modules
-- syntax highlighting
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      -- ["foo.bar"] = "Identifier",
    -- },
  },
}

-- Telescope config
require("telescope").setup()

nvim_lsp.tsserver.setup {
    on_attach = function(client, bufnr)
        -- disable tsserver formatting if you plan on formatting via null-ls
        client.resolved_capabilities.document_formatting = false

        local ts_utils = require("nvim-lsp-ts-utils")

        -- defaults
        ts_utils.setup {
            debug = false,
            disable_commands = false,
            enable_import_on_completion = true,

            -- import all
            import_all_timeout = 5000, -- ms
            import_all_priorities = {
                buffers = 4, -- loaded buffer names
                buffer_content = 3, -- loaded buffer content
                local_files = 2, -- git files or files with relative path markers
                same_file = 1, -- add to existing import statement
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,

            -- eslint
            eslint_enable_code_actions = true,
            eslint_enable_disable_comments = true,
            eslint_bin = "eslint",
            eslint_config_fallback = nil,
            eslint_enable_diagnostics = false,

            -- formatting
            enable_formatting = true,
            formatter = "prettier",
            formatter_config_fallback = nil,

            -- update imports on file move
            update_imports_on_move = true,
            require_confirmation_on_move = false,
            watch_dir = nil,
        }

        -- required to fix code action ranges
        ts_utils.setup_client(client)

        -- no default maps, so you may want to define some here
        local opts = {silent = true}
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", opts)
        -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
    end
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF



" TELESCOPE
nnoremap <silent><leader>t :Telescope<cr>



" COVERAGE
let g:coverage_json_report_path = 'coverage/coverage-final.json'
let g:coverage_sign_covered = '⦿'
let g:coverage_sign_uncovered = '∆'
let g:coverage_interval = 5000
let g:coverage_show_covered = 0
let g:coverage_show_uncovered = 1



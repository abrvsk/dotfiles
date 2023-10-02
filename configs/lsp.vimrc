" LSP
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>a     <cmd>lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader> rn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> g[    <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> g]    <cmd>lua vim.diagnostic.goto_prev()<CR>
" nnoremap <leader>or      <cmd>lua vim.lsp.buf.execute_command({command = "_typescript.organizeImports", arguments = {vim.fn.expand("%:p")}})<CR>
command! -nargs=0 OR   :lua vim.lsp.buf.execute_command({command = "_typescript.organizeImports", arguments = {vim.fn.expand("%:p")}})<CR>
nnoremap <silent> <leader>or :OR<cr>



" LSP server setup
lua << EOF
local nvim_lsp = require("lspconfig")

-- TreeSitter modules
-- syntax highlighting
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}

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

-- require'lspconfig'.csharp_ls.setup{}

-- omnisharp lsp config
require'lspconfig'.omnisharp.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end,
  cmd = { "C:/Users/andriib/AppData/Local/omnisharp-vim/omnisharp-roslyn/OmniSharp", "--languageserver" , "--hostPID", tostring(pid) },
 
  -- Enables support for reading code style, naming convention and analyzer
  -- settings from .editorconfig.
  enable_editorconfig_support = true,
 
  -- If true, MSBuild project system will only load projects for files that
  -- were opened in the editor. This setting is useful for big C# codebases
  -- and allows for faster initialization of code navigation features only
  -- for projects that are relevant to code that is being edited. With this
  -- setting enabled OmniSharp may load fewer projects and may thus display
  -- incomplete reference lists for symbols.
  enable_ms_build_load_projects_on_demand = true,
 
  -- Enables support for roslyn analyzers, code fixes and rulesets.
  enable_roslyn_analyzers = true,
 
  -- Only run analyzers against open files when 'enableRoslynAnalyzers' is true
  analyze_open_documents_only = false,
 
  -- Specifies whether 'using' directives should be grouped and sorted during
  -- document formatting.
  organize_imports_on_format = false,
 
  -- Enables support for showing unimported types and unimported extension
  -- methods in completion lists. When committed, the appropriate using
  -- directive will be added at the top of the current file. This option can
  -- have a negative impact on initial completion responsiveness,
  -- particularly for the first few completion sessions after opening a
  -- solution.
  enable_import_completion = true,
 
  -- Specifies whether to include preview versions of the .NET SDK when
  -- determining which version to use for project loading.
  sdk_include_prereleases = true,
}
EOF


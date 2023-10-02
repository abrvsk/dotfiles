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


" NETRW
" open netrw with Ctrl+E
nnoremap <silent> <C-e> :Explore<cr>

" ignore folders by netrw
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_list_stile=3
let g:netrw_ctags="ctags"
let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,node_modules,^\.\.\=/\=$'


" Create 'tags' file
command! MakeTags !ctags -R



" SNEAK
" sneak motion
let g:sneak#label = 1



" PRETTIER
" vim-prettier
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
autocmd BufWrite *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd Filetype typescript,typescriptreact setlocal omnifunc=v:lua.vim.lsp.omnifunc



" COVERAGE
let g:coverage_json_report_path = 'coverage/coverage-final.json'
let g:coverage_sign_covered = '⦿'
let g:coverage_sign_uncovered = '∆'
let g:coverage_interval = 5000
let g:coverage_show_covered = 0
let g:coverage_show_uncovered = 1



" Debug Adapter DAP
lua << EOF
local dap = require('dap')
dap.adapters.coreclr = {
  type = 'executable',
  command = '/path/to/dotnet/netcoredbg/netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
EOF



" SYMBOLS
lua << EOF
require("symbols-outline").setup {
  opts = {
    highlight_hovered_item = false,
    auto_preview = false,
    width = 20,
    wrap = true,
    keymaps = { -- These keymaps can be a string or a table for multiple keys
      close = {"<Esc>", "q"},
      goto_location = "<Cr>",
      focus_location = "o",
      hover_symbol = "<C-space>",
      toggle_preview = "K",
      rename_symbol = "r",
      code_actions = "a",
      fold = "h",
      unfold = "l",
      fold_all = "W",
      unfold_all = "E",
      fold_reset = "R",
    },
    symbols = {
      File = { icon = "", hl = "@text.uri" },
      Module = { icon = "", hl = "@namespace" },
      Namespace = { icon = "", hl = "@namespace" },
      Package = { icon = "", hl = "@namespace" },
      Class = { icon = "𝓒", hl = "@type" },
      Method = { icon = "ƒ", hl = "@method" },
      Property = { icon = "", hl = "@method" },
      Field = { icon = "", hl = "@field" },
      Constructor = { icon = "", hl = "@constructor" },
      Enum = { icon = "ℰ", hl = "@type" },
      Interface = { icon = "ﰮ", hl = "@type" },
      Function = { icon = "", hl = "@function" },
      Variable = { icon = "", hl = "@constant" },
      Constant = { icon = "", hl = "@constant" },
      String = { icon = "𝓐", hl = "@string" },
      Number = { icon = "#", hl = "@number" },
      Boolean = { icon = "⊨", hl = "@boolean" },
      Array = { icon = "", hl = "@constant" },
      Object = { icon = "⦿", hl = "@type" },
      Key = { icon = "🔐", hl = "@type" },
      Null = { icon = "NULL", hl = "@type" },
      EnumMember = { icon = "", hl = "@field" },
      Struct = { icon = "𝓢", hl = "@type" },
      Event = { icon = "🗲", hl = "@type" },
      Operator = { icon = "+", hl = "@operator" },
      TypeParameter = { icon = "𝙏", hl = "@parameter" },
      Component = { icon = "", hl = "@function" },
      Fragment = { icon = "", hl = "@constant" },
    },
  }
}
EOF




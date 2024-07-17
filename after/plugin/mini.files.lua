require('mini.files').setup({
    mappings = {
        go_in  = '<cr>',
        go_out = '-',
    },
    options = {
        permanent_delete = false,
        use_as_default_explorer = false,
    },
    window = {
        preview = true
    }
})

-- open mini file explorer popup
vim.keymap.set('n', '<leader>o', ':lua MiniFiles.open()<cr>', { desc = "Open file explorer in current split" })

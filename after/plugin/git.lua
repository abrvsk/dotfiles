vim.keymap.set('n', '<leader>g', ':G<cr> :Twiggy<cr>')
vim.keymap.set('n', '<leader>b', ':Git blame<cr>')
vim.keymap.set('n', '<leader>u', ':Git remote update origin --prune<cr>')

-- require 'neogit'.setup {
--     -- Changes what mode the Commit Editor starts in. `true` will leave nvim in normal mode, `false` will change nvim to
--     -- insert mode, and `"auto"` will change nvim to insert mode IF the commit message is empty, otherwise leaving it in
--     -- normal mode.
--     disable_insert_on_commit = 'auto',
--     -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
--     -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
--     auto_refresh = true,
--     -- Change the default way of opening neogit
--     kind = "split",
--     -- Disable line numbers and relative line numbers
--     disable_line_numbers = false,
-- }

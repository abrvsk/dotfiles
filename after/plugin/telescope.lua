local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>t', ':Telescope<cr>', {})
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<C-s>', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

local actions = require("telescope.actions")
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
}

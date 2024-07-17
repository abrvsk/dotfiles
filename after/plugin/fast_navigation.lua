require('hop').setup {}

vim.keymap.set('n', 's', ':HopChar2<cr>')
vim.keymap.set('n', '<leader>j', ':HopChar2<cr>')

-- Define a function to unmap 's' and 'S' in netrw
local function unmap_netrw_s()
  vim.api.nvim_exec([[
    autocmd FileType netrw nnoremap <buffer> s :HopChar2<cr>
    autocmd FileType netrw nnoremap <buffer> S :HopChar2<cr>
  ]], false)
end
-- Call the function to set up the autocmd
unmap_netrw_s()

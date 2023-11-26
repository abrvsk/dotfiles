-- -- change sneak label colour
-- vim.cmd('hi SneakScope guifg=black guibg=orange')
-- vim.cmd('hi SneakLabel guifg=black guibg=orange')
-- vim.cmd('hi Sneak guifg=black guibg=orange')

-- -- sneak motion
-- vim.g["sneak#label"] = 1
-- vim.cmd[[highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan]]

-- -- enable sneak colour change
-- vim.cmd('hi! link Sneak Search')

require('hop').setup{}

-- vim.cmd('autocmd filetype netrw nunmap <buffer> s')
vim.keymap.set('n', 's', ':HopChar2<cr>')
vim.keymap.set('n', '<leader>ho', ':HopChar2<cr>')

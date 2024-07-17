local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "<C-e>", vim.cmd.Ex)

map('n', '\\', ':vsplit<cr>', { silent = true })
map('n', '-', ':split<cr>', { silent = true })

-- remap leader related commands
map('n', '<leader>w', ":w<cr>", { silent = true })
map('n', '<leader>c', ":q<cr>", { silent = true })
map('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<cr>')

-- turn off search highlighting
map('n', '<leader>nh', ':nohl<cr>', { silent = true })

-- split movement
map('n', '<C-h>', '<C-w><C-h>', { silent = true })
map('n', '<C-j>', '<C-w><C-j>', { silent = true })
map('n', '<C-k>', '<C-w><C-k>', { silent = true })
map('n', '<C-l>', '<C-w><C-l>', { silent = true })

-- resize splits
map('n', '˙', '<C-w>5<', { silent = true })
map('n', '¬', '<C-w>5>', { silent = true })
map('n', '˚', '<C-w>2+', { silent = true })
map('n', '∆', '<C-w>2-', { silent = true })

-- jump between buffers
map('n', '<silent> <leader>]', ':bnext')
map('n', '<silent> <leader>[', ':bprev')

-- move highlighted text up and down
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '>-1<CR>gv=gv")

-- don't move cursor to the end
-- of the line on line append (J)
map('n', 'J', "mzJ`z")

-- center cursor on screen scroll
map('n', '<C-d>', "<C-d>zz")
map('n', '<C-u>', "<C-u>zz")

-- center cursor on search jumps
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- use void register when copy/pasting
-- preserves copied word when pasting
map('x', '<leader>p', "\"_dP")

-- disable Q
map('n', 'Q', "<nop>")

map('n', '<leader>f', function()
    vim.lsp.buf.format()
end)

-- search and replace word under cursor
map('n', '<leader>s', ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

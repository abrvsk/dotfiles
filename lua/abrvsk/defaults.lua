vim.opt.number = true
vim.wo.cursorline = true
-- darken the line numbers background
vim.cmd('hi LineNr guibg=Grey10')

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_list_stile = 3
vim.g.netrw_ctags = "ctags"
vim.g.netrw_list_hide = { ".*\\.swp$",".DS_Store", "*/tmp/*", "*.so", "*.swp", "*.zip", "*.git", "node_modules", "^\\.\\.\\=/\\=$" }

vim.opt.hidden = true
vim.opt.switchbuf = { usetab = true, newtab = true }
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.wildmenu = true  -- visual autocomplete for command menu
vim.opt.hlsearch = true  -- highlight matches
vim.opt.incsearch = true -- search as characters are entered
vim.opt.autochdir = false
vim.opt.linespace = 2
vim.opt.ignorecase = true

-- always show sign column
vim.opt.signcolumn = 'yes'

-- automatically update swap if file was changed
vim.opt.autoread = true
-- TODO: how to enable next line?!
-- au CursorHold * checktime

-- Make all swap files be saved in a temp directory instead of working one
vim.opt.swapfile = false

-- Better display for messages
vim.opt.cmdheight = 1
vim.opt.showcmd = true
vim.opt.clipboard = 'unnamed'

-- You will have bad experience for diagnostic messages when it's default 4000.
vim.opt.updatetime = 50

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.scrolloff = 4

-- show hidden symbols
vim.opt.list = true
vim.opt.listchars = { eol = '⏎', nbsp = '·', tab = '>-' }

-- highlight ColorColumn ctermbg=Magenta
vim.opt.colorcolumn = '80'

-- enable mouse in all modes
vim.opt.mouse = 'a'

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

-- autosave rust files on save
vim.g.rustfmt_autosave = 1

-- enable sneak labels
vim.g.syntax = 'enable'
vim.g.conceal = 'on'
vim.g.conceallevel = 2

" TELESCOPE
nnoremap <C-p> :Telescope git_files<cr>
nnoremap <C-f> :Telescope find_files<cr>
nnoremap <C-s> :Telescope live_grep<cr>
nnoremap <C-b> :Telescope buffers<cr>

lua << EOF
local actions = require("telescope.actions")
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
  extension = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
EOF


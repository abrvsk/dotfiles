local worktree = require("git-worktree")
local job = require('plenary.job')

worktree.on_tree_change(function(op, metadata)
  if op == worktree.Operations.Create then
    job:new({
      command = 'yarn.cmd',
      cwd = metadata.path,
      env = {
        PATH = vim.env.PATH,
        PANDELL_NPM_TOKEN = vim.env.PANDELL_NPM_TOKEN,
      },
      on_exit = function(j)
        for k, v in pairs(j:result()) do
          print(k .. ": " .. v)
        end

        print("`yarn install` executed")
      end
    }):start()
  end
end)

worktree.setup()

local telescope = require("telescope")
telescope.load_extension("git_worktree")

vim.keymap.set('n', '<leader>gwt', telescope.extensions.git_worktree.git_worktrees)
vim.keymap.set('n', '<leader>gwc', telescope.extensions.git_worktree.create_git_worktree)

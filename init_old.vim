" installations of plugins
source $HOME/.config/nvim/configs/init.vimrc
" vim specific variables
source $HOME/.config/nvim/configs/general.vimrc
" plugin settings
source $HOME/.config/nvim/configs/plugin-settings.vimrc
" basic behaviour
source $HOME/.config/nvim/configs/keymappings.vimrc
" LSP setup
source $HOME/.config/nvim/configs/lsp.vimrc
source $HOME/.config/nvim/configs/git.vimrc
" navigation and search in files
source $HOME/.config/nvim/configs/telescope.vimrc
" cosmetics
source $HOME/.config/nvim/configs/colourscheme.vimrc
source $HOME/.config/nvim/configs/statusline.vimrc
" diagnostics
source $HOME/.config/nvim/configs/trouble.vimrc


" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

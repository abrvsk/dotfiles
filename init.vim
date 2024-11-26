source $HOME/.config/nvim/configs/init.vimrc
source $HOME/.config/nvim/configs/general.vimrc
source $HOME/.config/nvim/configs/statusline.vimrc
source $HOME/.config/nvim/configs/plugins.vimrc
source $HOME/.config/nvim/configs/keymappings.vimrc


" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

# Create symbolic links in the home directory
ln -s $HOME/Development/configuration/vim-settings/.vimrc ~/.vimrc
ln -s $HOME/Development/configuration/vim-settings/.vim ~/.vim
ln -s $HOME/Development/configuration/vim-settings/nvim ~/.config/nvim

# Make sure that the directory exists before trying to link snippets
mkdir -p ~/.config/coc
ln -s $HOME/Development/configuration/vim-settings/ultisnips ~/.config/coc/ultisnips

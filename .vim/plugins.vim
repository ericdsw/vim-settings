filetype off					" Required

set rtp+=~/.vim/bundle/Vundle.vim		" Load vundle.vim file
call vundle#begin()				" Initialize vundle.vim

Plugin 'VundleVim/Vundle.vim'			" Vundle plugin, required
Plugin 'tpope/vim-vinegar'			" Better file browsing
Plugin 'ctrlpvim/ctrlp.vim'			" Finder for vim
Plugin 'scrooloose/nerdtree'			" Tree viewer for filesystem
Plugin 'flazz/vim-colorschemes'			" Color schemes
Plugin 'mileszs/ack.vim'			" Ack site-wide search plugin (Ag was deprecated)
Plugin 'skwp/greplace.vim'			" Search and Replace (depends on Ack)

call vundle#end()				" Finalized plugin regitration, required
filetype plugin indent on			" Required


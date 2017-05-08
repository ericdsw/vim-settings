filetype off					" Required

set rtp+=~/.vim/bundle/Vundle.vim		" Load vundle.vim file
call vundle#begin()				" Initialize vundle.vim

Plugin 'VundleVim/Vundle.vim'			" Vundle plugin, required
Plugin 'tpope/vim-vinegar'			" Better file browsing
Plugin 'ctrlpvim/ctrlp.vim'			" Finder for vim
Plugin 'scrooloose/nerdtree'			" Tree viewer for filesystem

call vundle#end()				" Finalized plugin regitration, required
filetype plugin indent on			" Required


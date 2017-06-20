filetype off                                    " Required

set rtp+=~/.vim/bundle/Vundle.vim               " Load vundle.vim file
call vundle#begin()                             " Initialize vundle.vim

Plugin 'VundleVim/Vundle.vim'                   " Vundle plugin, required
Plugin 'tpope/vim-vinegar'                      " Better file browsing
Plugin 'ctrlpvim/ctrlp.vim'                     " Finder for vim
Plugin 'scrooloose/nerdtree'                    " Tree viewer for filesystem
Plugin 'mileszs/ack.vim'                        " Ack site-wide search plugin (Ag was deprecated)
Plugin 'skwp/greplace.vim'                      " Search and Replace (depends on Ack)
Plugin 'SirVer/ultisnips'                       " Snippets plugin manager
Plugin 'honza/vim-snippets'                     " The actual snippets
Plugin 'tpope/vim-surround'                     " Modify surrounding text
Plugin 'ervandew/supertab'                      " Tab Completition
Plugin 'editorconfig/editorconfig-vim'          " EditorConfig support
Plugin 'sheerun/vim-polyglot'                   " Superior syntax highlight
Plugin 'tpope/vim-commentary'                   " Comment support
Plugin 'godlygeek/tabular'                      " Character alignment

" PHP Plugins
Plugin 'StanAngeloff/php.vim'                   " Improved PHP syntax highlight
Plugin 'arnaud-lb/vim-php-namespace'            " Better PHP Use statements
Plugin 'tobyS/vmustache'                        " Dependency for pvd
Plugin 'tobyS/pdv'                              " PHP Documentator
Plugin 'stephpy/vim-php-cs-fixer'               " PSR-2 formatting

" Godot Plugins
Plugin 'quabug/vim-gdscript'                    " GDScript syntax hightlight

call vundle#end()                               " Finalized plugin regitration, required
filetype plugin indent on                       " Required


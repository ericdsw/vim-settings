" Will try to install plug if no plug.vim is detected
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plug')

" General Plugins
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
Plug 'Valloric/YouCompleteMe', { 'do' : 'python3 install.py --ts-completer --clang-completer --java-completer --rust-completer' }
Plug 'yegappan/greplace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

" Colorschemes
Plug 'dracula/vim'
Plug 'romainl/Apprentice'
Plug 'sts10/vim-pink-moon'
Plug 'junegunn/seoul256.vim'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'nightsense/snow'
Plug 'sonph/onehalf'
Plug 'romainl/flattened'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'jacoborus/tender.vim'
Plug 'drewtempelmeyer/palenight.vim'

" PHP Plugs
Plug 'StanAngeloff/php.vim', { 'for' : 'php' }
Plug 'arnaud-lb/vim-php-namespace',  { 'for' : 'php' }
Plug 'tobyS/vmustache', { 'for' : 'php' }
Plug 'tobyS/pdv', { 'for' : 'php' }
Plug 'stephpy/vim-php-cs-fixer', { 'for' : 'php' }

" Godot Plugs
" Plug 'file://'.expand('~/Development/projects/misc/vim-gdscript3')
Plug 'ericdsw/vim-gdscript3', { 'for' : 'gdscript3' }

" Javascript Plugs
Plug 'pangloss/vim-javascript', { 'for' : 'javascript' }

" C# Plugins
Plug 'OmniSharp/omnisharp-vim'

call plug#end()

" Automatic Commands

" Automatically install missing plugins on startup
autocmd VimEnter *
    \ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|  PlugInstall --sync | q
    \|endif

" Automatically reload the .vimrc file on edit
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END


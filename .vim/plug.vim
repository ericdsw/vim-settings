" Will try to install plug if no plug.vim is detected
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plug')

" General Plugins
Plug 'tpope/vim-vinegar'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
Plug 'yegappan/greplace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

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
Plug 'habamax/vim-godot', { 'for': 'gdscript' }

" C# Plugins
Plug 'OmniSharp/omnisharp-vim'

" fzf
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

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


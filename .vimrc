"-------------------- Plugin Configuration ---------------------"

set nocompatible				    " We want the latest vim setup 
so ~/.vim/plugins.vim				    " Load plugin configuration file

"-------------------- General Configuration --------------------"

syntax enable					    " Enable syntax highlight
set backspace=indent,eol,start			    " Make backspace behave normally
set number					    " Display line numbers
set autoindent					    " New lines keeps current indentation
set autoread					    " Reload changes on disk
set softtabstop=4				    " Width of the indent in insert mode
set shiftwidth=4				    " Width of the indent in normal mode
let mapleader=','				    " Change default leader to comma

"-------------------------- Visuals ---------------------------"

set t_Co=256					    " Use 256 colors. This is useful for terminal vim
colorscheme atom-dark-256			    " Current color scheme

" Make line number background same as editor background
hi LineNr guibg=bg

" Make split separator invisible
hi vertsplit guifg=bg guibg=bg

"-------------------------- Search  ---------------------------"

set hlsearch					    " Enable General Search
set incsearch					    " Enable Incremental Search

"------------------------- Mappings  --------------------------"

" Shortcut to edit the .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Add simple highlight removal on vinegar search
nmap <Leader><space> :nohlsearch<cr>

" Make it easier to open nerdtree
nmap <Leader>1 :NERDTreeToggle<cr>

" Make it easier to search with Ctrl-P for tags 
nmap <c-R> :CtrlPBufTag<cr>

" Make it easier to browse recent files with Ctrl-P
nmap <D-e> :CtrlPMRUFiles<cr>

" Easier to search with c-tags
nmap <Leader>f :tag<space>

"---------------------- Split Management ----------------------"

set splitbelow					    " New horizontal splits will be created below the current window
set splitright					    " New vertical splits will be created to the right of the current window

" Easier switch to top pane on split
nmap <C-J> <C-W><C-J>

" Easier switch to bottom pane on split
nmap <C-K> <C-W><C-K>

" Easier switch to left pane on split
nmap <C-H> <C-W><C-H>

" Easier switch to right pane on split
nmap <C-L> <C-W><C-L>

"--------------------- Plugin Parameters ----------------------"

"/
"/ Ctrl-P
"/

" Ignored Files
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Result Window configuration
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"/
"/ NERDTree
"/

" Don't allow nerdtree to modify vinegar
let NERDTreeHijackNetrw = 0

"--------------------- Automatic Commands ---------------------"

" Automatically reload the .vimrc file on edit
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END


" Tips and Notes
" - Press 'zz' to instantly center the screen where the cursor is located
" - Press ctrl+] on top of a method to see where it was defined
" - Press ctrl+^ after the previous command to return to the original file
" - ctrl+w and | will make the split fill the screen

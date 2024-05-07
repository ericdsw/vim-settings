" Make sure we are using the correct terminal command when on windows,
" otherwise all tools will just throw a "cannot find bash" error
if has('win32') || has('win64')
    let &shell='cmd.exe'
endif

"-------------------- Plugin Configuration ---------------------"

set nocompatible                        " We want the latest vim setup
so ~/.vim/plug.vim				              " Load plugin configuration file

"-------------------- General Configuration --------------------"

syntax enable                           " Enable syntax highlight
set backspace=indent,eol,start          " Make backspace behave normally
set number                              " Display line numbers
set autoindent                          " New lines keeps current indentation
set autoread                            " Reload changes on disk
let mapleader=','                       " Change default leader to comma
set backupdir=~/.vim/backup//           " Put backup outside of project root
set directory=~/.vim/swap//             " Put swap files outside of project root

set noerrorbells visualbell t_vb=       " Disable error bells
set autowriteall                        " Automatically write the file when switching buffers.
set complete=.,w,b,u                    " Set our desired autocompletion matching.
set tabstop=2                           " Tab size equivalent to 4 spaces (for languages that use tabs)
set expandtab                           " Replaces tabs with spaces by default
set softtabstop=2
set shiftwidth=2

" Get rid of anoying line breaks
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set smartcase

"-------------------------- Visuals ---------------------------"

set t_Co=256                            " Use 256 colors (for terminal vim)
set background=dark                     " Background color

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Due to color rendering, graphical vim clients and terminal vim will 
" have different configurations
if has("gui_running")
    try
        colorscheme palenight
        let g:palenight_terminal_italics=1
    catch /^Vim\%((\a\+)\)\=E185/
        " Colorscheme was not found, skipping
    endtry
else
    set mouse=nicr
    try
        colorscheme catppuccin_frappe
        let g:palenight_terminal_italics=1
        if (has("nvim"))
            let $NVIM_TUI_ENABLE_TRUE_COLOR=1
       endif
   catch
        " Colorscheme was not found, skipping
    endtry
endif

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
    set termguicolors
endif

" Make line number background same as editor background
hi LineNr ctermbg=none
hi LineNr guibg=bg

" Make split separator invisible
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guibg=bg

" Change cursor highlight color
highlight Cursor guifg=black guibg=#777777

" Enable syntax highlight for .md files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"-------------------------- Search  ---------------------------"

set hlsearch                                " Enable General Search
set incsearch                               " Enable Incremental Search

"------------------------- Mappings  --------------------------"

" Shortcut to edit the .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Easier to search with c-tags
nmap <Leader>f :tag<space>

" Map double j to escape
inoremap jj <esc>

"---------------------- Split Management ----------------------"

" Splits should appear either below or to the right
set splitbelow
set splitright

" Easier to switch to panes on splits (same navigation as in normal mode)
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"/
"/ Set comment type for Godot
"/
autocmd FileType gdscript setlocal commentstring=#\ %s

"--------------------- Plugin Parameters ----------------------"


"/
"/ Lightline
"/

source ~/.vim/plug_configs/light_line.vim

"/
"/ FZF
"/
source ~/.vim/plug_configs/fzf.vim

"/
"/ NERDTree
"/
source ~/.vim/plug_configs/nerdtree.vim

"/
"/ Vinegar
"/

source ~/.vim/plug_configs/vinegar.vim

"/
"/ OmniSharp
"/

source ~/.vim/plug_configs/omnisharp.vim

"/
"/ COC.nvim
"/

source ~/.vim/plug_configs/coc.vim


"--------------------- Automatic Commands ---------------------"

" Automatically reload the .vimrc file on edit
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END


" Notes
" - Press 'zz' to instantly center the screen where the cursor is located
" - Press ctrl+] on top of a method to see where it was defined
" - Press ctrl+^ after the previous command to return to the original file
" - ctrl+w and | will make the split fill the screen
" - gg to go to the end of the file
" - G to go to the beginning of the file
" - Ack 'pattern' will make a site-wide search
" - :Gsearch 'pattern' will make a site-wide search for the pattern to replace
" - ctrl + 6 = back to previous file
" - cs <character> = change surrounding characters
" - ds <character> = deletes surrounding characters
" - crtl + w + q = quit tab
" - gt = go to next tab; Gt = go to previous tab
" - :cdo = applies to all files listed on quickfix
" - %s/String/ChangedString = changes all String to ChangedString
"
" Example of search and replace with fzf+ripgrep:
" :grep "pizza"
" :cfdo %s/pizza/donut/g | update
" This will replace all instances of "pizza" with "donut" in the project
"

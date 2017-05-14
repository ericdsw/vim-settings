"-------------------- Plugin Configuration ---------------------"

set nocompatible				    " We want the latest vim setup 
so ~/.vim/plugins.vim				    " Load plugin configuration file

"-------------------- General Configuration --------------------"

syntax enable					    " Enable syntax highlight
set backspace=indent,eol,start			    " Make backspace behave normally
set number					    " Display line numbers
set autoindent					    " New lines keeps current indentation
set autoread					    " Reload changes on disk
let mapleader=','				    " Change default leader to comma
set backupdir=~/.vim/backup//			    " Put backup outside of project root
set directory=~/.vim/swap//			    " Put swap files outside of project root

set noerrorbells visualbell t_vb=                   " Disable error bells
set autowriteall                                    " Automatically write the file when switching buffers.
set complete=.,w,b,u 				    " Set our desired autocompletion matching.
set tabstop=8					    
set expandtab
set softtabstop=4
set shiftwidth=4

" Get rid of anoying line breaks
set wrap                                            
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

"-------------------------- Visuals ---------------------------"

set t_Co=256					    " Use 256 colors. This is useful for terminal vim
set background=dark				    " Dark background
colorscheme sourcerer				    " Current color scheme

" Make line number background same as editor background
hi LineNr ctermbg=none
hi LineNr guibg=bg

" Make split separator invisible
hi vertsplit guifg=bg guibg=bg

"-------------------------- Search  ---------------------------"

set hlsearch					    " Enable General Search
set incsearch					    " Enable Incremental Search

"------------------------- Mappings  --------------------------"

" Shortcut to edit the .vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Shortcut to edit snippets
nmap <Leader>es :e ~/.vim/UltiSnips/

" Easier to search with c-tags
nmap <Leader>f :tag<space>

"---------------------- Split Management ----------------------"

set splitbelow					    " New horizontal splits will be created below the current window
set splitright					    " New vertical splits will be created to the right of the current window

" Easier to switch to panes on splits (same navigation as in normal mode) 
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"--------------------- Plugin Parameters ----------------------"

"/
"/ Ctrl-P
"/

let g:ctrlp_custom_ignore='vendor\|node_modules\|DS_Store\|git'
let g:ctrlp_match_window='top,order:ttb,min:1,max:30,results:30'

" Make it easier to search with Ctrl-P for tags 
nmap <c-R> :CtrlPBufTag<cr>

" Make it easier to browse recent files with Ctrl-P
nmap <D-e> :CtrlPMRUFiles<cr>

"/
"/ NERDTree
"/

" Don't allow nerdtree to modify vinegar browser
let NERDTreeHijackNetrw=0

" Make it easier to open nerdtree
nmap <Leader>1 :NERDTreeToggle<cr>

"/
"/ Vinegar
"/

" Add simple highlight removal on vinegar search
nmap <Leader><space> :nohlsearch<cr>

"/
"/ GReplace
"/

set grepprg=ack
let g:grep_cmd_opts='--noheading'

"/
"/ php-cs-fixer
"/
let g:php_cs_fixer_level="psr2"
let g:php_cs_fixer_fixers_list="-psr0"

"/
"/ pvd
"/
let g:pdv_template_dir=$HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

"/
"/ Ultisnip
"/

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

"/
"/ PHP vim namespaces
"/

" Expand classes in PHP use statements
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" Make class or function use their FQN
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

" Sorts use statements based on length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

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

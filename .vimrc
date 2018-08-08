"-------------------- Plugin Configuration ---------------------"

set nocompatible                            " We want the latest vim setup
so ~/.vim/plug.vim				        " Load plugin configuration file

"-------------------- General Configuration --------------------"

syntax enable                               " Enable syntax highlight
set backspace=indent,eol,start              " Make backspace behave normally
set number                                  " Display line numbers
set autoindent                              " New lines keeps current indentation
set autoread                                " Reload changes on disk
let mapleader=','                           " Change default leader to comma
set backupdir=~/.vim/backup//               " Put backup outside of project root
set directory=~/.vim/swap//                 " Put swap files outside of project root

set noerrorbells visualbell t_vb=           " Disable error bells
set autowriteall                            " Automatically write the file when switching buffers.
set complete=.,w,b,u                        " Set our desired autocompletion matching.
set tabstop=4                               " Tab size equivalent to 4 spaces (for languages that use tabs)
set expandtab                               " Replaces tabs with spaces by default
set softtabstop=4
set shiftwidth=4

" Get rid of anoying line breaks
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

"-------------------------- Visuals ---------------------------"

set t_Co=256                                " Use 256 colors. This is useful for terminal vim
set background=dark                         " Background color

" Due to color rendering, graphical vim clients and terminal vim will have different configurations
if has("gui_running")
    colorscheme onedark
else
    set termguicolors
    colorscheme deep-space
    set mouse=nicr
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

" Shortcut to edit snippets
nmap <Leader>es :e ~/.vim/UltiSnips/

" Easier to search with c-tags
nmap <Leader>f :tag<space>

" Map double j to escape
inoremap jj <esc>

"---------------------- Split Management ----------------------"

set splitbelow                              " New horizontal splits will be created below the current window
set splitright                              " New vertical splits will be created to the right of the current window

" Easier to switch to panes on splits (same navigation as in normal mode)
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"--------------------- Plugin Parameters ----------------------"

"/
"/ Ctrl-P
"/

let g:ctrlp_custom_ignore='vendor\|node_modules\|DS_Store\|git\|.import'
let g:ctrlp_match_window='top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_show_hidden=1

" Make it easier to search with Ctrl-P for tags
nmap <c-R> :CtrlPBufTag<cr>

" Make it easier to browse recent files with Ctrl-P
nmap <D-e> :CtrlPMRUFiles<cr>

"/
"/ NERDTree
"/

" Don't allow nerdtree to modify newtree
let NERDTreeHijackNetrw=0

" Make it easier to open nerdtree
nmap <Leader>1 :NERDTreeToggle<cr>

" Show hidden files by default
let NERDTreeShowHidden=1

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
"/ YouCompleteMe
"/

let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_server_python_interpreter = '/usr/local/bin/python3'

" Note: supertab allows both youcompleteme and ultisnips to be mapped to 'tab',
" even if it's mapped to another key in this configuration

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

"/
"/ PHP vim namespaces
"/
autocmd FileType gdscript setlocal commentstring=#\ %s

"/
"/ YouCompleteMe
"/

" Don't display errors in the editor
" let g:ycm_show_diagnostics_ui = 0

" Maps checking for errors in file
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" Auto-closes preview window with method or class documentation after exiting insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1

" Debugging
let g:ycm_server_keep_log_files = 1
let g:ycm_server_log_level = 'debug'

"/
"/ OmniSharp
"/

let g:OmniSharp_server_type = 'v1'

" Omnisharp / syntastic cooperation
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

nnoremap <leader>th :OmniSharpHighlightTypes<cr>

augroup omnisharp_commands
    autocmd!
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()
    autocmd FileType cs nnoremap <leader>x :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
augroup END

nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
nnoremap <leader>th :OmniSharpHighlightTypes<cr>

"/
"/ PHP vim namespaces
"/
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" let g:syntastic_javascript_checkers = ['ESLint', 'JSLint']

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

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
       colorscheme palenight
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

" Shortcut to edit snippets
" nmap <Leader>es :e ~/.vim/UltiSnips/

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

"--------------------- Plugin Parameters ----------------------"

"/
"/ Lightline
"/

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

"/
"/ Ctrl-P
"/

let g:ctrlp_custom_ignore='vendor\|node_modules\|DS_Store\|git\|.import\|addons\|exports\|(\.(swp|ico|git|svn))$|Resources/(Images|Sounds)\'
let g:ctrlp_match_window='top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_show_hidden=1

" Make it easier to search with Ctrl-P for tags
nmap <c-R> :CtrlPBufTag<cr>

" Make it easier to browse recent files with Ctrl-P
nmap <D-e> :CtrlPMRUFiles<cr>


" Use ag if it exists.
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

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

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

""/
""/ YouCompleteMe
""/

"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

"/
"/ Vim-emmet
"/
" let g:user_emmet_leader_key='<Tab>'
" let g:user_emmet_settings = {
"     \ 'javascript.jsx': {
"         \ 'extends': 'jsx',
"     \ },
" \}

" Set the python interpreter path
" Note: the path will be different depending on whether the system is OSX or
" Linux
if has("unix")
    let s:uname = substitute(system("uname"), '\n', '', '')
    if s:uname != "Darwin"
        let g:ycm_server_python_interpreter = '/usr/bin/python3.6'
    else
        let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
    endif
endif

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
"/ Set comment type for Godot
"/
autocmd FileType gdscript setlocal commentstring=#\ %s

"/
"/ YouCompleteMe
"/

" Don't display errors in the editor
" let g:ycm_show_diagnostics_ui = 0

" Maps checking for errors in file
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" " Auto-closes preview window with method or class documentation after exiting insert 
" " mode
" let g:ycm_autoclose_preview_window_after_insertion = 1

" " Debugging
" let g:ycm_server_keep_log_files = 1
" let g:ycm_server_log_level = 'debug'

"/
"/ ALE (Linter)
"/

let g:ale_linters = {
\ 'cs': ['OmniSharp'],
\ 'javascript': ['eslint'],
\ 'typescript': ['tsserver', 'tslint']
\}

let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'typescript': ['prettier'],
\}
let g:ale_fix_on_save = 1

"/
"/ OmniSharp
"/

let g:OmniSharp_timeout=5
set completeopt=longest,menuone,
set previewheight=5
let g:OmniSharp_highlight_types=1

augroup omnisharp_commands
    autocmd!

    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
    autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()
    
    autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementation<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbols<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
augroup END

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

"/
"/ COC.nvim
"/

set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
" Tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()

if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Coc extension declaration
let g:coc_global_extensions = [
    \'coc-markdownlint',
    \'coc-highlight',
    \'coc-json',
    \'coc-css',
    \'coc-snippets',
    \'coc-tsserver'
    \]

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

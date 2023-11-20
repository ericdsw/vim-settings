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
       colorscheme onedark
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

"--------------------- Plugin Parameters ----------------------"

"/
"/ Lightline
"/

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

"/
"/ FZF
"/
nnoremap <silent> <C-p> :Files<CR>
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

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
"/ php-cs-fixer
"/
let g:php_cs_fixer_level="psr2"
let g:php_cs_fixer_fixers_list="-psr0"

"/
"/ pvd
"/
let g:pdv_template_dir=$HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

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

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Coc extension declaration
let g:coc_global_extensions = [
    \'coc-markdownlint',
    \'coc-highlight',
    \'coc-json',
    \'coc-css',
    \'coc-snippets',
    \'coc-tsserver'
    \]

" Shortcut to open the json configuration file.
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')

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

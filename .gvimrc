" General UI Configuration
set guioptions-=e				    " Disable GUI Tabs
set linespace=12				    " Custom line space
set guioptions-=l				    " Disable left scroll bar
set guioptions-=L				    " Disable left scroll bar for splits
set guioptions-=r				    " Disable right scroll bar
set guioptions-=R				    " Disable right scroll bar for splits
set guioptions-=m				    " Disables Menu
set guioptions-=T				    " Removes Toolbar

" Font Definition
if has("gui_running")
    if has("gui_gtk2") " Font configuration for gtk2 (linux UI editor)
	set guifont=Cousine\ 10
    elseif has("gui_macvim") " Font configuration for macvim
	set guifont=Fira_Code:11
	set macligatures
    elseif has("gui_win32") " Font configuration for windoge (lol)
	set guifont==Consolas:h11:cANSI
    endif
endif

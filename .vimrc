execute pathogen#infect()
set nocompatible
syntax on
filetype plugin indent on

:set background=dark
let g:vimwiki_list=[{'path': '~/Dropbox/wiki/files/'}, {'path_html': '~/Dropbox/wiki/html/'}]
":autocmd InsertEnter,InsertLeave * set cul!
set laststatus=2
colorscheme Revolution


"GENERAL FORMATTING / COLORS
set cursorline
autocmd InsertEnter * highlight CursorLine guifg=NONE guibg=#00008b guisp=#161616 gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
autocmd InsertLeave * highlight CursorLine guifg=NONE guibg=#000000 guisp=#161616 gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE

"LEDGER FORMATTING
"turn off 'you complete me' if that package is included
if exists('g:ycm_filetype_blacklist')
	call extend(g:ycm_filetype_blacklist, { 'ledger': 1})
endif
" set the make file for Ledger
autocmd Filetype ledger setlocal makeprg=make\ -f\ ~/Documents/Finance/Ledger1.makefile 

"perform autocompletions and value alignment with the <Tab> key
au FileType ledger inoremap <Tab> <C-r>=ledger#autocomplete_and_align()<CR>
"in visual mode, Align all values (so can align multiple at once)
" aligns when selecting visual blocks
au FileType ledger vnoremap <Tab> :LedgerAlign<CR>
" toggles through the state of the transactions (cleared, pending, etc)
au FileType ledger noremap <silent><buffer><C-\> :call ledger#transaction_state_toggle(line('.'), ' *?!')<CR>
"set strict values
let g:ledger_extra_options ='--pedantic --explicit --check-payees'

" TODO autocommands
command -nargs=* Todo :!python3 ~/Dropbox/quickscripts/get_todo.py <args>

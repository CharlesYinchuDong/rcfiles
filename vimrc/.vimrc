" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Syntax highlighting.
syntax on

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

"-------------------------------------------------------------------------------------
"Usability
"-------------------------------------------------------------------------------------
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Display row number on the left side.
set number
highlight LineNr ctermfg=DarkGrey 
" Highlight the current row
set cursorline
highlight CursorLine cterm=NONE ctermbg=238 ctermfg=NONE 
" NOTE: Configure iTerm2 if you want to change the color of the cursor and
" text under.

" Change the cursor shape in different modes
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

" Reduce the timeout length to avoid the lag when using <esc> to switch mode
" When using tmux, also need to:
" (1) Put "set -sg escape-time 10" in ".tmux.conf"
" (2) Put "maptimeout 10" in ".screenrc"
set timeout
set timeoutlen=1000
set ttimeout
set ttimeoutlen=0

"set cursorline
"highlight CursorLine cterm=NONE ctermbg=238 ctermfg=NONE 

"""
""" Setup for Python
"""
autocmd FileType python nnoremap <buffer> <F5> :exec 'w' <cr> :exec '!clear; python' shellescape(@%, 1)<cr>
autocmd BufEnter *.py colorscheme Tomorrow-Night-Eighties

"------------------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------------
"" Plugins will be downloaded under the specified directory.
"call plug#begin('~/.vim/plugged')
"
"" Declare the list of plugins.
"
"""" 
"""" Markdown file
""""
"
"""" Goyo write mode
"Plug 'junegunn/goyo.vim'
"
"" List ends here. Plugins become visible to Vim after this call.
"call plug#end()

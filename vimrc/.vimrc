""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Metadata
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic vimrc.
" Author: Charles Yinchu Dong
" Github: https://github.com/CharlesYinchuDong/rcfiles/tree/master/vimrc

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (need to be the first section as it is required downstream)
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare a list of plugins.
" NerdTree
Plug 'preservim/nerdtree'

" CtrlSF
Plug 'dyng/ctrlsf.vim'

" FZF: command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" OneDark color theme (like Atom)
Plug 'joshdick/onedark.vim'
" Language pack that improves OneDark theme (optional but recommended)
Plug 'sheerun/vim-polyglot'

" Render Markdown file.
Plug 'JamshedVesuna/vim-markdown-preview'

" Auto-close parentheses and quotes
" Plug 'Raimondi/delimitMate'
Plug 'tmsvg/pear-tree'

" Goyo write mode
"Plug 'junegunn/goyo.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" NerdTree - Set the width based on number of columns.
let g:NERDTreeWinSize=60


""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Usability
""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Minimal automatic indenting for any filetype.
"set autoindent
" Indent for JS
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab
"autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
"autocmd FileType c3 setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" TODO: Figure out what's it about
" Proper backspace behavior.
" set backspace=indent,eol,start

" Possibility to have more than one unsaved buffers.
" set hidden

" Highlight searches 
set hlsearch
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" Search as characters are entered
set incsearch

" Fold method (default to not fold anything)
set foldmethod=syntax
set foldlevel=99
autocmd FileType python setlocal foldmethod=indent
let javaScript_fold=1

" Reduce the timeout length to avoid the lag when using <esc> to switch mode
" When using tmux, also need to:
" (1) Put "set -sg escape-time 10" in ".tmux.conf"
" (2) Put "maptimeout 10" in ".screenrc"
set timeout
set timeoutlen=1000
set ttimeout
set ttimeoutlen=0

" Leave minimum lines/columns around the cursor.
set scrolloff=1
set sidescrolloff=1

" Open up new split window to RIGHT or BELOW
set splitbelow
set splitright

"""
""" Setup for Python
"""
autocmd FileType python nnoremap <buffer> <F5> :exec 'w' <cr> :exec '!clear; python' shellescape(@%, 1)<cr>

" Automatically set the current file to be the current directory.
"autocmd BufEnter * silent! lcd %:p:h


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme onedark

" Display row number on the left side.
set number relativenumber
highlight LineNr ctermfg=DarkGrey 
" Highlight the current row.
set cursorline
"highlight CursorLine cterm=NONE ctermbg=238 ctermfg=NONE 
" NOTE: Configure iTerm2 if you want to change the color of the cursor and
" text under.

" Change the cursor shape in different modes.
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

" Set color theme to OneDark
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"colorscheme onedark

set colorcolumn=80

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mapping / Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the leader key.
let mapleader = ","

" Fzf file search and content search.
map <leader>f :Files<cr>
map <leader>s :Ag<cr>

" Use <C-L> to temporarily turn off highlighting search result.
nnoremap <C-L> :noh<CR>

" Open the NerdTree
map <C-n> :NERDTreeToggle<CR>
" Find the current file in the NerdTree.
map <leader>n :NERDTreeFind<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Metadata
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Personal vimrc.
" Author: Charles Yinchu Dong
" Github: https://github.com/CharlesYinchuDong/rcfiles/tree/master/vimrc

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (need to be the first section as some of them are required downstream)
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" NerdTree.
Plug 'preservim/nerdtree'
" CtrlSF.
Plug 'dyng/ctrlsf.vim'
" FZF: command-line fuzzy finder.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" OneDark color theme (like Atom).
Plug 'joshdick/onedark.vim'
" Gruvbox color theme.
Plug 'morhetz/gruvbox'
" Language pack that improves OneDark theme (optional but recommended).
Plug 'sheerun/vim-polyglot'
" Render Markdown file.
Plug 'JamshedVesuna/vim-markdown-preview'
" Auto-close parentheses and quotes.
Plug 'tmsvg/pear-tree'
" Git wrapper.
Plug 'tpope/vim-fugitive'
call plug#end()

" NerdTree - Set the width based on number of columns.
let g:NERDTreeWinSize=60

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Usability
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable compatibility with vi to prevent unexpected behaviors.
set nocompatible

" Turn off beeping bell sound for all events.
set belloff=all

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Better command-line completion.
set wildmenu
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Show partial commands in the last line of the screen.
set showcmd
" Show which mode we are in.
set showmode

" Proper backspace behavior.
set backspace=indent,eol,start

" Allow unwritten buffers to be not visible.
set hidden

" Highlight searches.
set hlsearch
" Use case insensitive search, except when using capital letters.
set ignorecase
set smartcase
" Search as characters are entered.
set incsearch

" Reduce the timeout length to avoid the lag when using <esc> to switch mode
" When using tmux, also need to:
" (1) Put "set -sg escape-time 10" in ".tmux.conf".
" (2) Put "maptimeout 10" in ".screenrc".
set timeout
set timeoutlen=1000
set ttimeout
set ttimeoutlen=0

" Leave minimum lines/columns around the cursor.
set scrolloff=5
set sidescrolloff=5

" Open up new split window to RIGHT or BELOW.
set splitbelow
set splitright

" Do not wrap lines.
set nowrap

" Don't update the display while executing macros
set lazyredraw

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => File-specific 
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab.
" TODO: Set up shifts for all file types.
" Minimal automatic indenting for any filetype.
" Indent for JS
set tabstop=2
set shiftwidth=2
set autoindent
set expandtab
"autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
"autocmd FileType c3 setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Fold
" Fold method (default to not fold anything)
set foldmethod=syntax
set foldlevel=99
autocmd FileType python setlocal foldmethod=indent
let javaScript_fold=1

"""
""" Python
"""
autocmd FileType python nnoremap <buffer> <F5> :exec 'w' <cr> :exec '!clear; python' shellescape(@%, 1)<cr>

"""
""" Javascript
"""

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on syntax highlighting.
syntax on

" Choose a color theme.
colorscheme onedark
"colorscheme gruvbox

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

" Display row number on the left side.
set number relativenumber
highlight LineNr ctermfg=DarkGrey 
" Highlight the current row.
set cursorline
"highlight CursorLine cterm=NONE ctermbg=238 ctermfg=NONE 

" Change the cursor shape in different modes.
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)
" NOTE: Configure iTerm2 if you want to change the color of the cursor and
" text under.

" Have a vertical line to hightlight width 80.
set colorcolumn=80

" Clear status line when vimrc is reloaded.
set statusline=
" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R
" Use a divider to separate the left side from the right side.
set statusline+=%=
" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
" Always display status line.
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell & Syntax Checking
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set language to English, and not do spell check on east Asian words.
set spelllang=en,cjk

""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mapping / Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set space as the leader key.
let mapleader = " "

" Fzf file search and content search.
map <leader>f :Files<CR>
map <leader>s :Rg<CR>

" Use <C-L> to temporarily turn off highlighting search result.
" Also to turn off spell checking.
nnoremap <C-L> :noh<CR>:setlocal nospell<CR>

" Open the NerdTree.
nnoremap <C-n> :NERDTreeToggle<CR>
" Find the current file in the NerdTree.
nnoremap <leader>n :NERDTreeFind<CR>

" Navigate split window with hjkl.
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Navigate tabs by number.
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>0 :tablast<CR>
" Toggle between the current and last active tab.
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <leader>o :exe "tabn ".g:lasttab<CR>

" Git wrapper.
nmap <leader>gf :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>
nmap <leader>gs :G<CR>

" Spell checking.
nnoremap <leader>c :setlocal spell<CR>

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :tabnew $MYVIMRC<CR>
" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<CR>

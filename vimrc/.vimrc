" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.

""" 
""" Markdown file
"""

""" Goyo write mode
Plug 'junegunn/goyo.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

:set filetype=json
:syntax on
:set foldmethod=syntax

"""
""" Setup for Python
"""
autocmd FileType python nnoremap <buffer> <F5> :exec 'w' <cr> :exec '!clear; python' shellescape(@%, 1)<cr>

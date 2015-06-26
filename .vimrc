set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'voithos/vim-python-matchit'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
set hlsearch
set background=dark
colorscheme solarized
set number

" binds
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

set pastetoggle=<F3>
nnoremap <F2> :set nonumber!<CR>
nnoremap <F4> :noh<CR>
nnoremap <F5> :! python %<CR>
nnoremap <F6> :! python -m unittest %<CR>

" edit vimrc
nnoremap <leader>ev <C-w><C-s><C-l>:e $MYVIMRC<CR>

" gui config
set guifont=DejaVu\ Sans\ Mono\ 12
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" keep .swp outside of working directory
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set writebackup

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" py syntastic
let g:syntastic_python_checkers=['flake8', 'python']
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_flake8_exe='python3 -m flake8'
" Don't warn on
" E121 continuation line indentation is not a multiple of four
" E128 continuation line under-indented for visual indent
" E301 expected 1 blank line, found 0
" E261 at least two spaces before inline comment
" E241 multiple spaces after ':'
" E123 closing brack does match indentation of opening bracket's line
" E124 closing bracket does not match visual indentation
" E126 continuation line over-indented for hanging indent
" E721 do not compare types, use 'isinstance()'
let g:syntastic_python_flake8_args='--ignore=E121,E128,E301,E261,E241,E123,E124,E126,E721'

" watch vimrc for changes and reload
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

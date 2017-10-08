set nocompatible              " be iMproved, required
filetype off                  " required

syntax enable
set hlsearch
set ignorecase " ignore case on search
set smartcase " except when input has capital
set incsearch " hl while typing
set background=dark
set number

set splitbelow " sp opens below
set splitright " vs opens right

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
nnoremap <F7> :! py.test<CR>

" edit vimrc
nnoremap <leader>ev <C-w><C-s><C-l>:e $MYVIMRC<CR>

" gui config
if has("gui_macvim")
        set guifont=Monaco:h14
else
        set guifont=DejaVu\ Sans\ Mono\ 12
endif
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

" python
autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
                        \ formatoptions=croqj textwidth=79
let python_highlight_all=1
let python_slow_sync=1

" ruby
autocmd FileType ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
                        \ autoindent textwidth=119

" javascript
autocmd Filetype javascript setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" watch vimrc for changes and reload
augroup reload_vimrc " {
        autocmd!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

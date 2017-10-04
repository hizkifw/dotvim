"
" HizkiFW's .vimrc
"

" Stuff
filetype plugin on
filetype indent on

" Auto read file when changed
set autoread

" Indentation stuff
set tabstop=4
set shiftwidth=4
set smarttab
set smartindent
set autoindent
set expandtab

" Move vim turds to a separate directory
set dir=/home/hizkifw/.vim/turds

" No line wrapping
set nowrap
" Except for certain files
augroup WrapLine
	autocmd!
	autocmd FileType markdown setlocal wrap
augroup END

" Disable sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Display
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif
set number
set so=5

" Syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

" Encoding stuff
set encoding=utf8
set ffs=unix,dos,mac

" Key combos
let mapleader = " "
let g:mapleader = " "

" Quicksave
nmap <leader>w :w!<cr>
" Switch windows
nmap <leader><cr> <C-w>w
" Ctrl-S save 
imap <C-s> <esc>:w<cr>i<right>
" Toggle NerdTree
nmap <leader>n :NERDTreeToggle<cr>
" Moving around
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-t> :gt<cr>

" Commands
" sudo save
command! W w !sudo tee % > /dev/null


" Plugins
call plug#begin('~/.vim/plugvim')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
call plug#end()


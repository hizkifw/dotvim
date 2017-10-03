"
" HizkiFW's .vimrc
"

" Stuff
filetype plugin on
filetype indent on

" Auto read file when changed
set autoread

" Show line numbers
set number

" Set width to 4 spaces
set tabstop=4

" Endable auto indentation
set autoindent

" Move vim turds to a separate directory
set dir=/home/hizkifw/.vim/turds

" No line wrapping
set nowrap
" Except for certain files
augroup WrapLine
	autocmd!
	autocmd FileType markdown setlocal wrap
augroup END

" Key combos
let mapleader = " "
let g:mapleader = " "

" Quicksave
nmap <leader>w :w!<cr>
" Switch windows
nmap <leader><cr> <C-w>w
" Ctrl-S save 
imap <C-s> <esc>:w<cr>i<right>

" Commands
" sudo save
command! W w !sudo tee % > /dev/null


" Plugins
call plug#begin('~/.vim/plugvim')
Plug 'tpope/vim-fugitive'
call plug#end()


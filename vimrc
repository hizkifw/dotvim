"
" HizkiFW's .vimrc
"

" ===========================================================================
" General
" ===========================================================================

" Set .vim directory
if has("win32")
    let vimhome = $HOME . '/vimfiles'
else
    let vimhome = $HOME . '/.vim'
endif

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
let &dir = vimhome . '/turds'

" No line wrapping
set nowrap
" Except for certain files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup WrapLine
	autocmd!
	autocmd FileType markdown setlocal linebreak
    autocmd FileType markdown setlocal wrap
augroup END

" Disable sounds
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

" Persistent undo
try
    let &undodir = vimhome . '/temp/undodir'
    set undofile
catch
endtry

" Encoding stuff
set encoding=utf8
set ffs=unix,dos,mac

" ===========================================================================
" Display
" ===========================================================================

colorscheme molokai
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif
" Show line numbers
set number
" Vertical cursor margin
set so=5
" Always show status thing
set laststatus=2
" Column width marker
set colorcolumn=80,120

" Disable scrollbar
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" ===========================================================================
" Key combos
" ===========================================================================

" Set leader to spacebar
let mapleader = " "
let g:mapleader = " "

" Quicksave
nmap <leader>w :w<cr>
" Quickclose
nmap <leader>c :clo<cr>
nmap <leader>q :q<cr>
" Ctrl-S save 
imap <C-s> <esc>:w<cr>i<right>
" Toggle NerdTree
nmap <leader>n :NERDTreeToggle<cr>
" Toggle Goyo
nmap <leader>g :Goyo<cr>
" Creating tabs and windows
nmap <leader>t :tabnew<cr>
nmap <leader>v :vnew<cr>
nmap <leader>s :split<cr>
nmap <leader><cr> <C-w>w
" Moving around tabs and windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-t> :gt<cr>
" Move lines
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
" Spellcheck
map <leader>sc :setlocal spell!<cr>
" Yank to end of line
map Y y$

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===========================================================================
" Commands
" ===========================================================================

" sudo save
command! W w !sudo tee % > /dev/null


" ===========================================================================
" Plugins
" ===========================================================================

" PlugVim
runtime! ftplugin/man.vim
set rtp+=$HOME/.local/lib/python3.5/site-packages/powerline/bindings/vim/
call plug#begin(vimhome . '/plugvim')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'yegappan/mru'
Plug 'valloric/youcompleteme'
Plug 'junegunn/goyo.vim'
Plug 'wakatime/vim-wakatime'
call plug#end()

" Syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

" NERDTree
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeNaturalSort = 1

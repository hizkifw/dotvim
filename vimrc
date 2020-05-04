"
" HizkiFW's .vimrc
"

" ===========================================================================
" General
" ===========================================================================

" Set backspace type (for gVim on Windows)
set bs=2

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
set tabstop=2
set shiftwidth=2
set smarttab
set smartindent
set autoindent
set expandtab

" Code folding
set foldmethod=indent
set nofoldenable

" Disable vim swap files
set noswapfile

" No line wrapping
set nowrap
" Except for certain files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.txt set filetype=plaintext
augroup WrapLine
    autocmd!
    autocmd FileType markdown,plaintext,tex setlocal linebreak
    autocmd FileType markdown,plaintext,tex setlocal wrap
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

" Session options
set sessionoptions=blank,winsize,tabpages,resize,buffers,help

" Encoding stuff
set encoding=utf8
set ffs=unix,dos,mac

" ===========================================================================
" Display
" ===========================================================================

colorscheme molokai
if $COLORTERM == 'gnome-terminal' || $VIM_COLORFUL == 1
    set t_Co=256
    " Fix weird colors on scroll
    set t_ut=
endif
" GUI font
set guifont=Source_Code_Pro
" Remove gVim toolbars
if has("gui_running")
    set guioptions -=T
    set guioptions -=m
endif
" Show line numbers
" set number
" Vertical cursor margin
set so=5
" Hide status bar when no other windows
set laststatus=1
" Column width marker
" set colorcolumn=80,120
" Show vim commands
set showcmd
" Highlight current line
" set cursorline

" Disable scrollbar
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Search highlight
set is

" ===========================================================================
" Key combos
" ===========================================================================

" Set leader to spacebar
let mapleader = " "
let g:mapleader = " "

" Add lines surrounding
nmap <leader>o O<esc>jo<esc>ki
" Quicksave
nmap <leader>w :w<cr>
nmap <leader>W :w!<cr>
" Quickclose
nmap <leader>cl :clo<cr>
nmap <leader>qa :qa<cr>
" Toggle NerdTree
nmap <leader>n :NERDTreeToggle<cr>
" Toggle Goyo
nmap <leader>go :Goyo<cr>
" Creating tabs and windows
nmap <leader>t :tabnew<cr>
nmap <leader>v :vnew<cr>
nmap <leader>e :new<cr>
nmap <leader><cr> <C-w>w
" Moving around tabs and windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nmap <leader>j gt
nmap <leader>k gT
nmap <leader>h :tabm -1<cr>
nmap <leader>l :tabm +1<cr>
" Basic window layout manipulation
nmap <leader>sl <C-w>L
nmap <leader>sk <C-w>K
nmap <leader>sj <C-w>J
nmap <leader>sh <C-w>H
" Git stuff
nmap <leader>ga :! git add .<cr>
nmap <leader>gw :Gwrite<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gp :Gpush<cr>
" Spellcheck
map <leader>sc :setlocal spell!<cr>
" Yank to end of line
map Y y$
" Remap F1 key to Escape
map <F1> <Esc>
imap <F1> <Esc>
" Put current buffer to clipboard
nmap <leader>y :! cat % \| xclip -selection clipboard<cr><cr>

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Fix Python indents
inoremap # X<bs>#

" ===========================================================================
" Plugins
" ===========================================================================

" PlugVim
runtime! ftplugin/man.vim
set rtp+=$HOME/.local/lib/python3.5/site-packages/powerline/bindings/vim/
call plug#begin(vimhome . '/plugvim')
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tcbbd/detectindent'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'wakatime/vim-wakatime'
Plug 'easymotion/vim-easymotion'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'alvan/vim-closetag'
Plug 'sbdchd/neoformat'
call plug#end()

" Conquer of Completion
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-python',
  \ ]
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" NERDTree
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeIgnore = ['^node_modules$']

" EasyMotion
map ; <Plug>(easymotion-s)

" vim-closetag
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" DetectIndent
augroup DetectIndent
    autocmd!
    autocmd BufReadPost * DetectIndent
augroup END

" neoformat every file save
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Neoformat

" ===========================================================================
" Commands
" ===========================================================================

" sudo save
command! W exec 'w !sudo dd of=' . shellescape(expand('%'))

fun! ReadMode()
    :Goyo 120
    set lbr
    set wrap
endfunction

fun! NoReadMode()
    :Goyo
    set nolbr
    set nowrap
endfunction

" Reading mode
command Read call ReadMode()
command NoRead call NoReadMode()

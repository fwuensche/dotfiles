""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL 

set nocompatible            " get rid of Vi compatibility mode. SET FIRST!
let mapleader = "\<Space>"  " change default leader key
set history=1000            " increase command history limit
set splitbelow              " create new horizontal windows below
set splitright              " create new horizontal windows to the right

set scrolloff=5             " minimal number of lines before and after cursor
set number                  " show line numbers
set numberwidth=3           " make the number gutter n characters wide
set cul                     " highlight current line
set laststatus=2            " last window always has a statusline
set ruler                   " always show info along bottom.

set hlsearch                " don't continue to highlight searched phrases.
set incsearch               " but do highlight as you type your search.
set ignorecase              " ignore case sensitive in the file
set smartcase               " if you type in camel case, assume camel case
nmap <Leader>c :nohlsearch<cr> 

set mouse=a                 " enable mouse in all modes


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FORMATTING & LAYOUT

set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smartindent           " automatically insert one extra level of indentation
set nowrap                " don't wrap text
set autoindent            " auto-indent

" Make search results appear on the middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" cycle to next and previous buffer
nnoremap <S-Tab> gT
nnoremap <Tab> gt


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMPLUG

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'

" add molokai theme
Plug 'tomasr/molokai'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes

" Configs to make Molokai look great
let g:molokai_original=1  
let g:rehash256=1  
colorscheme molokai  



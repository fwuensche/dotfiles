""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL

let mapleader = "\<Space>"  " change default leader key

set nocompatible            " get rid of Vi compatibility mode. SET FIRST!
set history=1000            " increase command history limit
set undofile                " undo even after closing file
set encoding=utf-8          " change default encoding

" lines
set number                  " show line numbers
set numberwidth=2           " make the number gutter n characters wide
set relativenumber          " restart line number on current line
set cul                     " highlight current line

" info
set laststatus=2            " last window always has a statusline
set ruler                   " always show info along bottom.

set mouse=a                 " enable mouse in all modes (yep, mouse! so what?)

" search
set hlsearch                " don't continue to highlight searched phrases.
set incsearch               " but do highlight as you type your search.
set ignorecase              " ignore case sensitive in the file
set ignorecase              " seach non case sentitive
set smartcase               " if start as camelcase, then camelcase
set gdefault                " always replace globally with :%s/
nmap <Leader>c :nohlsearch<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FORMATTING & LAYOUT

set scrolloff=5             " minimal number of lines before and after cursor
set splitbelow              " create new horizontal windows below
set splitright              " create new horizontal windows to the right

" tabulation & indentantion
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set expandtab             " use spaces instead of tabs
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set smartindent           " automatically insert one extra level of indentation
set autoindent            " auto-indent
set nowrap                " don't wrap text

" make search results appear on the middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" cycle to next and previous tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM MAPPINGS

" escape
inoremap jj <ESC>

" edit vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" and auto reload it
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" add lines and avoid insert mode
nmap O O<Esc>
nmap o o<Esc>k

" open window split vertically
nnoremap <leader>d <C-w>v<C-w>l

" jump through blocks
nmap J }
vmap J }
nmap K {
vmap K {

" go to next blank line with alt-arrow
map <Esc>^[^[[B {
map <Esc>^[^[[A }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS

call plug#begin('~/.vim/plugged')

" janus plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'

" other
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'haya14busa/incsearch.vim'

" themes
Plug 'flazz/vim-colorschemes'
Plug 'tomasr/molokai'
Plug 'alessandroyorba/despacio'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin related customizations

" open ctrlP files in a new tab by default
" https://github.com/kien/ctrlp.vim/issues/160
" let g:ctrlp_prompt_mappings = {
"     \ 'AcceptSelection("e")': ['<c-t>'],
"     \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
"     \ }
" ctrlP: open on a new tab
nmap <leader>p :tab split<cr>:CtrlP<cr>

" ack: open search on a new tab
nmap <leader>a :tab split<cr>:Ack ""<left>

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" commentary
noremap <leader>/ :Commentary<cr>

" theme
colorscheme neutron

" nerd tree
nnoremap <leader>\ :NERDTreeToggle<cr>


" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
" function! s:incsearch_config(...) abort
"   return incsearch#util#deepextend(deepcopy({
"   \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
"   \   'keymap': {
"   \     "\<CR>": '<Over>(easymotion)'
"   \   },
"   \   'is_expr': 0
"   \ }), get(a:, 1, {}))
" endfunction

" noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
" noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
" noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

map /  <Plug>(incsearch-forward)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)


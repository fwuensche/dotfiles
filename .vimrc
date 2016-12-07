""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL

let mapleader = "\<Space>"  " change default leader key
set mouse=a                 " enable mouse in all modes (yep, mouse! so what?)
set nocompatible            " get rid of Vi compatibility mode. SET FIRST!
set history=1000            " increase command history limit
set undofile                " undo even after closing file
set encoding=utf-8          " change default encoding
set laststatus=2            " last window always has a statusline
set ruler                   " always show info along bottom.
set autowriteall            " auto save when changing buffer

" lines
set number                  " show line numbers
set numberwidth=2           " make the number gutter n characters wide
set relativenumber          " restart line number on current line
set cul                     " highlight current line

" search
set hlsearch                " don't continue to highlight searched phrases.
set incsearch               " but do highlight as you type your search.
set ignorecase              " ignore case sensitive in the file
set ignorecase              " seach non case sentitive
set smartcase               " if start as camelcase, then camelcase
set gdefault                " always replace globally with :%s/

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FORMATTING & LAYOUT

set scrolloff=5           " minimal number of lines before and after cursor
set splitbelow            " create new horizontal windows below
set splitright            " create new horizontal windows to the right

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
nmap <S-Tab> [b
nmap <Tab> ]b


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM MAPPINGS

"select all
map <leader>a <esc>ggVG<CR>

" copy selected text to system clipboard
vnoremap <silent> <leader>c :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>

" open buffer list
nnoremap <leader>b :ls<cr>:b<space>
" open new buffer (aka tab)
nnoremap <leader>t :enew<cr>
" wipe (close) current buffer
nnoremap <leader>w :bd<cr>
" save current buffer
nnoremap <leader>s :w<cr>
" quit vim
nnoremap <leader>q :qa<cr>

" escape
inoremap jj <ESC>
inoremap kk <ESC>

" edit vimrc and zshrc
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>ez :e $HOME/.zshrc<cr>

" and auto reload it
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd BufWritePost $MYVIMRC AirlineRefresh
augroup END " }

" add lines and avoid insert mode
nmap O O<Esc>
nmap o o<Esc>k

" open window split vertically
nnoremap <leader>d :vnew<CR>

" grab lines up and down
nnoremap ∆ ddp
nnoremap ˚ ddkP

" jump through blocks
nmap J }
vmap J }
nmap K {
vmap K {
nmap L e
vmap L e
nmap H b
vmap H b

" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>


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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'severin-lemaignan/vim-minimap'

" themes
Plug 'flazz/vim-colorschemes'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin related customizations

" open ctrlP files in a new tab by default
" https://github.com/kien/ctrlp.vim/issues/160
" let g:ctrlp_prompt_mappings = {
"     \ 'AcceptSelection("e")': ['<c-t>'],
"     \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
"     \ }

" ctrlP: open on a new buffer
nmap <leader>p :CtrlP<cr>

" ack: open search on a new tab
nmap <leader>F :Ack ""<left>
nmap <leader>f /
let g:ackprg = 'ag --nogroup --nocolor --column'

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" commentary
noremap <leader>/ :Commentary<cr>

" theme
colorscheme solarized
set background=dark

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

" Airline plugin
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme='luna'
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

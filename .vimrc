execute pathogen#infect()
" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

set nocompatible
filetype off
filetype plugin indent on
filetype on
filetype plugin indent on
syntax enable
set background=dark
colorscheme predawn
set noantialias
set nofoldenable
set wildmenu
set wildmode=list:longest
set textwidth=120

set ruler
set omnifunc=syntaxcomplete#Complete
set omnifunc=javacomplete#Complete
set completefunc=javacomplete#CompleteParamsInfo
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>
inoremap <C-A> <C-X><C-O>
set shiftwidth=4
set tabstop=4
set softtabstop=4
set nu
set et
set completeopt=longest,menuone
set tabpagemax=15

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap jk <esc>
nnoremap ; :
nnoremap : ;
inoremap lkj <esc> 80i=<return>

ab ghj printf("

autocmd VimEnter * NERDTree
let g:pymode_rope_lookup_project = 0
let g:clang_use_library = 1

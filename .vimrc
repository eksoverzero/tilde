set encoding=utf-8
scriptencoding utf-8

set nocompatible

filetype off
filetype plugin indent on

so ~/.vim/plugins.vim

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set list
" set listchars=tab:→\ ,space:·,nbsp:_,trail:~,eol:$,precedes:<,extends:>
set listchars=tab:→\ ,space:·,trail:~,
set laststatus=2
set noshowmode

syntax on

" Open new split panes to right and bottom
set splitbelow
set splitright

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" Set the colorscheme
colorscheme molokai

" ----- tomasr/molokai settings -----
let g:rehash256 = 1

" ----- vim-airline/vim-airline settings -----
let g:airline_theme='raven'
let g:airline_detect_paste=1

" ----- jistr/vim-nerdtree-tabs -----
" Show hidden files
let NERDTreeShowHidden=1

" Open/close NERDTree with \t
nmap <silent> <leader>t :NERDTreeToggle<CR>

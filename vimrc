execute pathogen#infect()
syntax on
filetype plugin indent on
" turn vi compatibility off
set nocompatible
set showmode
set nowrap
set tabstop=4
set ruler
set hlsearch
set incsearch
set lazyredraw
set showmatch
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
set smarttab
set tags=tags
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftround
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set ignorecase
set smartcase
set visualbell
set noerrorbells
set autowrite
set smarttab
set ai
set si
set guioptions-=T
set guioptions-=r
set background=dark
set linespace=25
set guifont=Anonymous\ Pro\ for\ Powerline\ 14

autocmd Filetype html setlocal ts=2 sts=2 sw=2


if has('autocmd')
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd BufWritePre *.php,*.js,*.css,*.html :call <SID>StripTrailingWhitespaces()
endif

let g:airline_powerline_fonts=1
let g:airline_theme="dark"

let NERDTreeShowHidden=1

vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

set laststatus=2
set encoding=utf-8
set noshowmode

" set leader to comma
let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>

nnoremap j gj
nnoremap k gk

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab shortcuts
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

nmap <C-j> :tabprev<CR>
nmap <C-h> :tabnext<CR>
map <C-n> <Esc>:tabnew
" Escape shortcut
imap jj <esc>

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
" map nerdtree command to ctrl + b
nmap <C-b> :NERDTreeToggle<cr>

highlight Search cterm=underline

"Bubble lines
" http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Visual bubble lines
nmap <C-Up> xkP`[V`]
nmap <C-Down> xp`[V`]

if has('gui_running')
    let g:airline_theme="dark"
    colorscheme vividchalk
    :set guioptions -=m
    :set guioptions -=T
endif

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and curor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    "Clean up: Restory prev search history and cursor position.
    let @/=_s
    call cursor(l,c)
endfunction

set listchars=tab:▸\ ,eol:¬
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
map <F7> mzgg=G`z<CR>

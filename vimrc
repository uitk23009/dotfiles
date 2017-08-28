set nocompatible

filetype off

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
call plug#end()

set rtp+=~/.fzf

"general settings
filetype plugin on
filetype indent on
syntax on
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

" Fix backspace indent
set backspace=indent,eol,start

" Tabs
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Searching
set incsearch
set hlsearch
set ic
set smartcase

" Directories for wap files
set nobackup
set noswapfile

set showcmd

set clipboard=unnamed
set number
set cursorline
set ruler
set t_Co=256


if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"airline{
    set laststatus=2
    let g:airline_theme='term'
"}

"NERDTree{
    map <F2> :NERDTreeToggle<CR>
    let NERDTreeShowBookmarks = 1
    let NERDTreeShowHidden = 1
"}

"syntastic{
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
"}

"nerdcommenter{
    let mapleader=","
"}

"t-comment{
    map <c-/> <c-_><c-_>
    map <c-b> <c-_>b
"}

"neocomplete{
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
"}

"indentLine{
    let g:indentLine_concealcursor = 'inc'
    let g:indentLine_conceallevel = 2
"}

"use j and k choose complete
inoremap <expr> j pumvisible() ? '<C-n>' : 'j'
inoremap <expr> k pumvisible() ? '<C-p>' : 'k'


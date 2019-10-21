#!/bin/sh

yum -y install git tmux

# set tmux config

cat > ~/.tmux.conf << EOL
set -g base-index 1
set-option -g base-index 1
set-window-option -g pane-base-index 1
setw -g mode-keys vi
set -g status-right '#{prefix_highlight} | %a %Y-%m-%d %H:%M'
set -g prefix C-a
unbind C-b

bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
bind c new-window -c "#{pane_current_path}"
EOL

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# set vimrc

cat > ~/.vimrc << EOL
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/vim-slash'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tpope/vim-unimpaired'
Plug 'svermeulen/vim-easyclip'
call plug#end()

set rtp+=~/.fzf

set nocompatible

" general settings
filetype plugin indent on
syntax on

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set ttyfast

" Fix backspace indent
set backspace=indent,eol,start

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smarttab
set expandtab
set autoindent
set smartindent
set smartcase

" Searching
set incsearch
set hlsearch
set ic

" Directories for wap files
set nobackup
set noswapfile

set showcmd
set clipboard=unnamed
set number
set cursorline
set ruler
set t_Co=256
set autochdir
set autoread

" Buffer
set nostartofline

" Autocomplete
set completeopt=longest,menuone

" Performance
set lazyredraw
set hidden
set re=1

" Command complete menu
set wildmenu

packadd! matchit

" no show waning message
autocmd FileChangedRO * echohl WarningMsg | echo "File changed RO." | echohl None
autocmd FileChangedShell * echohl WarningMsg | echo "File changed shell." | echohl None

" lightline {
    set laststatus=2
    let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'readonly', 'absolutepath', 'modified' ] ],
        \ }
        \ }
"}

" t-comment {
    noremap <c-/> <c-_>
"}

" indentLine {
    let g:indentLine_concealcursor = 'inc'
    let g:indentLine_conceallevel = 2
"}

" learder {
    let mapleader=","
    let g:mapleader=","
"}

" basic {
    " fast save
    nnoremap <leader>w :w!<CR>
    " :W sudo save the file
    command! W w !sudo tee % > /dev/null
"}

" fzf {
    nnoremap <c-p> :Files /ma<CR>
"}


" buffer {
    " navigation
    nmap <leader>b :bp<CR>
    nmap <leader>f :bn<CR>
    " buffer list
    nmap <leader>l :ls<CR>
    " delete buffer
    nmap <leader>d :bd<CR>
    " open new buffer
    nmap <leader>v :vsplit<CR>
    nmap <leader>s :split<CR>
    nmap <leader>o <C-w>o

    " resize
    if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
    endif
"}

" buftabline {
    let g:buftabline_numbers = 2
    let g:buftabline_indicators = 1
    " mapping
    nmap <leader>1 <Plug>BufTabLine.Go(1)
    nmap <leader>2 <Plug>BufTabLine.Go(2)
    nmap <leader>3 <Plug>BufTabLine.Go(3)
    nmap <leader>4 <Plug>BufTabLine.Go(4)
    nmap <leader>5 <Plug>BufTabLine.Go(5)
    nmap <leader>6 <Plug>BufTabLine.Go(6)
    nmap <leader>7 <Plug>BufTabLine.Go(7)
    nmap <leader>8 <Plug>BufTabLine.Go(8)
    nmap <leader>9 <Plug>BufTabLine.Go(9)
    nmap <leader>0 <Plug>BufTabLine.Go(10)
    " color scheme
    hi BufTabLineCurrent ctermfg=50
    hi BufTabLineHidden ctermfg=67
    hi BufTabLineActive ctermfg=97
"}


" window {
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
"}

" easyclip {
    let g:EasyClipUseSubstituteDefaults = 1
"}

" use j and k choose complete
inoremap <expr> j pumvisible() ? '<C-n>' : 'j'
inoremap <expr> k pumvisible() ? '<C-p>' : 'k'

" use <c-n>、<c-p> choose command history
cnoremap <C-n> <down>
cnoremap <C-p> <up>

" don't lose selection when shifting sidewards
xnoremap < <gv
xnoremap > >gv

" bracketed paste mode (valid in tmux)
if has('patch-8.0.0238')
    if &term =~ "screen"
        let &t_BE = "\e[?2004h"
        let &t_BD = "\e[?2004l"
        exec "set t_PS=\e[200~"
        exec "set t_PE=\e[201~"
    endif
else
    if has('patch-8.0.0210')
        set t_BE=
    endif

    if &term =~ "xterm" || &term =~ "screen"
        function XTermPasteBegin(ret)
            set paste
            set pastetoggle=<Esc>[201~
            return a:ret
        endfunction

        let &t_ti .= "\e[?2004h"
        let &t_te .= "\e[?2004l"

        noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
        inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
        vnoremap <special> <expr> <Esc>[200~ XTermPasteBegin("c")
        cnoremap <special> <Esc>[200~ <nop>
        cnoremap <special> <Esc>[201~ <nop>
    endif
endif

" Fix matchparen plugin slow {
    let g:matchparen_timeout = 20
    let g:matchparen_insert_timeout = 20
"}

" autochdir {
    "autochdir for some plugins
    autocmd BufEnter * silent! lcd %:p:h
    "command for quick directory change
    nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" }

" remap ESC
inoremap <c-c> <ESC>
EOL

vim +PlugInstall +qall

call pathogen#infect()

set history=500 "remember last 500 commands

" Enable filetype plugin
filetype on
filetype plugin on

" Auto-read file if externally modified
set autoread

set wildmenu
set wildmode=list:longest,full "better tab completion

set ruler "Always show current position

set bs=2 "Normal backspace

set ignorecase "these next 2 make /-style and *-style searches case insensitive,
set smartcase  "and case-sensitive, respectively

set hlsearch " highlights searched terms
set incsearch " searches as you type in terms

set magic " Pattern matching with special chars

set showmatch

" Disable sounds
set noerrorbells
set novisualbell
set t_vb=

syntax on " Syntax highlighting

" Do we really need this extra files?
set nobackup
set nowb
set noswapfile

" Fix tabs for formatting
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

set lbr " Wrap lines at words

set ai " Auto-indent
set si " Smart-indent
set wrap " Wrap lines

set hidden "Allows multiple buffers to be managed
set nocompatible "allows for backwards imcompatible changes to be in effect

set showmode " Show current mode (Insert,Replace,Visual,etc)
set showcmd
set laststatus=2 " Always show status line

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
set encoding=utf-8 " Necessary to show unicode glyphs
colorscheme torte " Feel free to change this

set ttyfast " Help with slow scrolling

" F2 to toggle paste-mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" F3 to toggle line numbers
nnoremap <F3> :set invnu nu?<CR>

" F4 to toggle relative line numebrs
nnoremap <F4> :set invrnu rnu?<CR>

let g:gist_browser_command = 'chrome %URL%'
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_clip_command = 'xclip -selection clipboard'

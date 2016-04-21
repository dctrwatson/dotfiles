set runtimepath+=$GOROOT/misc/vim
set runtimepath+=$HOME/gocode/src/github.com/golang/lint/misc/vim

set nocompatible "allows for backwards imcompatible changes to be in effect
set backspace=indent,eol,start

" Better modes.  Remeber where we are
set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo

" Pathogen
call pathogen#infect()

set history=500 "remember last 500 commands

" Enable filetype plugin
filetype on
filetype plugin on
filetype plugin indent on

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

" Tab Settings
set smarttab
set tabstop=8

set lbr " Wrap lines at words

set ai " Auto-indent
set si " Smart-indent
set wrap " Wrap lines

set hidden "Allows multiple buffers to be managed

set showmode " Show current mode (Insert,Replace,Visual,etc)
set showcmd
set laststatus=2 " Always show status line

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
set encoding=utf-8 " Necessary to show unicode glyphs
colorscheme myterm " Feel free to change this

set ttyfast " Help with slow scrolling

" keep some more lines for scope
set scrolloff=5

" enable automatic title setting for terminals
set title
set titleold="Terminal"
set titlestring=%F

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

let g:rbpt_colorpairs = [
  \ ['brown',       'RoyalBlue3'],
  \ ['Darkblue',    'SeaGreen3'],
  \ ['darkgray',    'DarkOrchid3'],
  \ ['darkgreen',   'firebrick3'],
  \ ['darkcyan',    'RoyalBlue3'],
  \ ['darkred',     'SeaGreen3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['brown',       'firebrick3'],
  \ ['gray',        'RoyalBlue3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['Darkblue',    'firebrick3'],
  \ ['darkgreen',   'RoyalBlue3'],
  \ ['darkcyan',    'SeaGreen3'],
  \ ['darkred',     'DarkOrchid3'],
  \ ['red',         'firebrick3'],
\ ]
let g:rbpt_max = 15

" Always enable rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:is_bash = 1

" python support
" --------------
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with

autocmd BufWritePost *.py call Flake8()
let g:flake8_ignore="E129"
let g:flake8_max_line_length=100
let g:flake8_max_complexity=50

" YAML support
" ------------
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2
autocmd BufNewFile,BufRead *.sls setlocal ft=yaml

" Lua support
" -----------
autocmd FileType lua setlocal shiftwidth=2 tabstop=2 softtabstop=2

" vim
" ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" Javascript
" ----------
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
autocmd FileType javascript setlocal commentstring=//\ %s

" Dot support
" -----------
autocmd FileType dot setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Shell support
" -------------
autocmd FileType sh setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

" php support
" -----------
autocmd FileType php setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" protobuf support
" ----------------
autocmd FileType proto setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd BufNewFile,BufRead *.proto setlocal ft=proto

" supervsior support
" ----------------
autocmd FileType supervisor setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd BufNewFile,BufRead *.supervisor setlocal ft=supervisor

"
" Unmap > mapping for puppet
autocmd FileType puppet iunmap <buffer> <silent> >
autocmd FileType puppet setlocal shiftwidth=4 tabstop=4 softtabstop=4

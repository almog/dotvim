"" Pathogen
call pathogen#infect()
call pathogen#helptags()

"set nocompatible                " choose no compatibility with legacy vi
"syntax enable
set encoding=utf-8
set fileencoding=utf-8
"set showcmd                     " display incomplete commands
"filetype plugin indent on       " load file type plugins + indentation

set clipboard=unnamed

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set softtabstop=2
"set expandtab                   " use spaces, not tabs (optional)
"set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set number
set numberwidth=3
syn on
set autoindent
set expandtab

""Color Scheme
let g:moria_termcolors = 256
let g:moria_visibility = 'high'
let g:moria_contrast = 'high'
let moria_style = 'dark' 
colo moria

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

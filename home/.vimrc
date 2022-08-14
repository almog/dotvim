if executable('/bin/zsh')
  set shell=/bin/zsh
endif

"" vundle
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/vundle'

Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'nelstrom/vim-markdown-folding'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

call vundle#end()

"set nocompatible                " choose no compatibility with legacy vi
"syntax enable
set encoding=utf-8
set fileencoding=utf-8
filetype plugin indent on       " load file type plugins + indentation


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

set showcmd " Show line/chars count under selection

""Color Scheme
colorscheme solarized
set background=dark

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

let g:ctrlp_max_files=0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/webpack/*,*/vendor/*     " MacOSX/Linux

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|\webpack$\vendor$\public$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


""Highlight ruby files that don't end with .rb
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

"let mapleader = ","
"" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"No arrow keys
vnoremap <Up> <NOP>
inoremap <Up> <NOP>
vnoremap <Down> <NOP>
inoremap <Down> <NOP>
vnoremap <Left> <NOP>
inoremap <Left> <NOP>
vnoremap <Right> <NOP>
inoremap <Right> <NOP>
"Enable j/k movements when using <CR>-N completions
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

vnoremap <Leader>a y:Ack <C-r>=fnameescape(@")<CR><CR>

nmap ,n :NERDTreeToggle<CR>

let mapleader = ","
set re=1
set foldmethod=expr

:set number relativenumber
:set nu rnu

" run the current file
nnoremap <leader>r :!clear; DEBUG=1 %:p<Enter>
"nnoremap <leader>p :w; !clear; DEBUG=1 python3 %:p<Enter>
nnoremap <leader>p :w<CR>:!clear; DEBUG=1 python3 %<CR>

" Repeat last ex command
nnoremap <leader><leader> @:

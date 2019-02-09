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
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'thoughtbot/vim-rspec'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'elzr/vim-json'
Plugin 'godlygeek/tabular'
Plugin 'isRuslan/vim-es6'
Plugin 'sbdchd/neoformat'
" Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'

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

nmap ,n :NERDTreeFind<CR>

let mapleader = ","
set re=1
set foldmethod=expr

if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

"autocmd BufWritePre *.js Neoformat
"autocmd BufWritePre *.es6 Neoformat
"autocmd BufWritePre *.jsx Neoformat

"mark syntax errors with :signs
"let g:syntastic_enable_signs=1
""automatically jump to the error when saving the file
"let g:syntastic_auto_jump=0
"show the error list automatically
"let g:syntastic_auto_loc_list=1
""don't care about warnings
"let g:syntastic_quiet_messages = {'level': 'warnings'}

" Default to eslint. If you need jshint, you can override this in
" " ~/.vimrc.after
"let g:syntastic_javascript_checkers = ['eslint']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
""let g:syntastic_check_on_wq = 0
"
"let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['javascript'], 'passive_filetypes': [] }
let g:ale_linters = {
\   'javascript': ['prettier'],
\}

" run the current file
nnoremap <leader>r :!clear; %:p<Enter>

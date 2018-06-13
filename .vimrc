if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype plugin on

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ayu-theme/ayu-vim'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'oranget/vim-csharp'
call plug#end()

let mapleader=","

set term=xterm-256
syntax on
set termguicolors
let ayucolor="dark"
colorscheme ayu
let g:airline_theme='ayu'

" Cygwin compatibility
set t_Co=8
set t_Sb=m
set t_Sf=m

set nocp
set number
set showcmd
set backspace=indent,eol,start
set list
set nobackup
set noswapfile
set tabstop=4
set softtabstop=4 expandtab
set shiftwidth=4
set ignorecase
set smartcase
set showmatch
set incsearch
set hlsearch
set ignorecase
set laststatus=2
set cursorline
set splitbelow
set timeoutlen=1000 ttimeoutlen=0
set lazyredraw
set wildmenu
set wildmode=longest:full,full

let g:indent_guides_start_level=2

let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_cache_dir = $HOME . './cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Close vim if NERDTree is the only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Custom key mappings
map <C-a> ggVG<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
map <C-Left> :tabprevious<CR>
map <C-Right> :tabnext<CR>
map <F5> :!./scripts/dev.sh<CR>
map <F8> :!clear;g++ *.cpp -o output;./output<CR>

nnoremap n nzz
nnoremap N Nzz
nnoremap <silent> vv <C-w>v
nnoremap <silent> vs <C-w>s
nnoremap <silent> vh <C-w>h
nnoremap <silent> vj <C-w>j
nnoremap <silent> vk <C-w>k
nnoremap <silent> vl <C-w>l
nnoremap <silent> v= <C-w>=
nnoremap <CR> :noh<CR><CR>
nnoremap <silent> <leader>l :setlocal cursorline!<CR>
nnoremap <silent> <leader>n :setlocal number!<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>g :Gdiff :0<CR>
nnoremap <leader>s :%s/\s\+$//e<CR>
nnoremap <leader>t :!clear;tagf<CR>

" Easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

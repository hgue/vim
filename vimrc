" ######################################################################################
" General "{{{
set nocompatible               " be iMproved

scriptencoding utf-8           " utf-8 all the way
set encoding=utf-8

set history=256                " Number of things to remember in history.
set timeoutlen=1000            " mapping delay (ms)
set ttimeoutlen=0              " key code delays (ms)
set clipboard+=unnamed         " Yanks go on clipboard instead.
set pastetoggle=<F10>          " toggle between paste and normal: for 'safer' pasting from keyboard
set shiftround                 " round indent to multiple of 'shiftwidth'
set tags=.git/tags;$HOME       " consider the repo tags first, then
                               " walk directory tree upto $HOME looking for tags
                               " note `;` sets the stop folder. :h file-search

set modeline
set modelines=5                " default numbers of lines to read for modeline instructions

set hlsearch                   " highlight search
set ignorecase                 " be case insensitive when searching
set smartcase                  " be case sensitive when input has a capital letter
set incsearch                  " show matches while typing
set gdefault                   " search globaly by default :%s/foo/bar/ instead of :%s/foo/bar/g

set shell=/bin/bash

" "}}}



" ######################################################################################
" Formatting "{{{


set nowrap
set textwidth=0                " Don't wrap lines by default

set hidden                     " This allows buffers to be hidden if you've modified a buffer.
set et                         " use spaces, no tabs
set tabstop=4                  " tab size eql 2 spaces
set softtabstop=4
set shiftwidth=4               " default shift width for indents
set expandtab                  " replace tabs with ${tabstop} spaces
set smarttab                   "

set foldmethod=indent          " Enable folding
set foldlevel=99

set backspace=indent
set backspace+=eol
set backspace+=start

set autoindent
set cindent
set indentkeys-=0#             " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case

" "}}}



" ######################################################################################
" Visual "{{{

set mouse=a                    " Enable mouse in GUI mode 
set mousehide                  " Hide mouse after chars typed

if has("syntax")
    syntax on                  " Turn on syntax if possible.
endif

set t_Co=256
set background=dark
colorscheme Tomorrow-Night

" Column 80 marker
" highlight OverLength ctermbg=red ctermfg=white guibg=#660000
"match OverLength /\%81v.\+/

"set cursorline
"set relativenumber           " relative line numbers!
set number                    " line numbers
set showmatch                 " show matching (), {}, [] when typing
set matchtime=2               " Backet blinking.

set wildmode=longest,list     " At command line, complete longest common string, then list alternatives.
set completeopt+=preview

set switchbuf=usetab,newtab   " If the target buffer is already displayed in a window in one of the tabs, that window will be displayed. Otherwise in new tab
set showtabline=2             " Always show tabs
set noerrorbells              " No noise.
set visualbell t_vb=          " disable any beeps or flashes on error (terminal)
autocmd GUIEnter * set visualbell t_vb= " disable any beeps or flashed on error (GUI mode)

set laststatus=2              " always show status line

" setting console fonts
if has("gui_running")
    if has ("gui_gtk2")
        "set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
    elseif has("gui_win32")
        "set guifont=Consolas:h11:cANSI
    endif
endif

" }}}
" #############################################################################
" Key mappings " {{{

let mapleader = ","

" Use normal regex string instead of vim's own
nnoremap / /\v
vnoremap / /\v

nnoremap <leader><space> :noh<cr>       " Clear search results with <leader><space>
nnoremap <leader>v <C-w>v<C-w>l         " Split window vertical and switch over
nnoremap <leader>h :split<C-w>l         " Split window horizontal and switch over

nmap <F2> :NERDTreeToggle<cr>

nmap <silent> <C-Up> <C-W>k
nmap <silent> <C-Down> <C-W>j
nmap <silent> <C-Left> <C-W>h
nmap <silent> <C-Right> <C-W>l

" Tab navigation mappings
" CTRL-Tab is next tab
map <C-Tab> <Esc>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
map <C-S-Tab> <Esc>:tabprevious<CR>
" CTRL-Insert/Delete is open/close tab
map <C-Insert> :tabnew<cr>
map <C-Delete> :tabclose<cr>

" System clipboard copy/paste
map <leader>y "*y
map <leader>p "*p

" Move across wrapped lines like regular lines
noremap 0 ^ " Go to the first non-blank character of a line
noremap ^ 0 " Just in case you need to go to the very beginning of a line

" " }}}
" #############################################################################
" Scripts and Plugins " {{{

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Plug 'scrooloose/nerdtree'

Plug 'terryma/vim-multiple-cursors'
set selection=inclusive
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

Plug 'ryanoasis/vim-devicons'

Plug 'Raimondi/delimitMate'

Plug 'http://kien.github.com/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

call plug#end()

" " }}}
    


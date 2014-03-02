"just testing
set langmenu=C
set helplang=en
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,koi8-r,cp1251,default,latin1
syntax on
" No silly toolbar
set guioptions-=T
  
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/vimfiles/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/vimfiles/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/unite.vim'

NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'

NeoBundle 'derekwyatt/vim-fswitch'

NeoBundle 'Townk/vim-autoclose'

NeoBundle 'SirVer/ultisnips'

NeoBundle 'jonathanfilip/vim-lucius'

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tab stuff
" how many columns a tab counts for. 
set tabstop=4
" how many columns text is indented with the reindent operations (<< and >>) 
set shiftwidth=4
set softtabstop=4
" When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces.
" set noexpandtab

"Indent stuff
set smartindent
set autoindent

" Hybrid numbering
set number
set relativenumber

"Better line wrapping 
set wrap
set textwidth=99
set formatoptions=qrn1

"Set incremental searching"
set incsearch
set hlsearch "Highlight searching
set showmatch

" case insensitive search
set ignorecase
set smartcase

set cindent

set splitright
set splitbelow

"Auto-completion menu
set wildmode=list:longest

" Start scrolling when we're 10 lines away from margins
" set scrolloff=10
" set scrolloff=0

set encoding=utf-8

set ttyfast

set autoread

"set list listchars=trail:·

set foldmethod=indent "fold based on indent
set foldnestmax=2 "deepest fold is 2 levels
set nofoldenable "dont fold by default

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" @TODO: no hardcoding
set directory=~/vimfiles/tmp

"Search/replace commands have /g by default, add /g to override
set gdefault

" Add the unnamed register to the clipboard
set clipboard+=unnamed

inoremap kj <esc> " seems to be best, right-to-left movement

nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Don't move cursor when joining lines
nnoremap J mqJ`q
" Center screen on search next/prev
nnoremap n nzz
nnoremap N Nzz
"nnoremap } }zz

" easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Using '<' and '>' in visual mode to shift code by a tab-width left/right by
" default exits visual mode. With this mapping we remain in visual mode after
" such an operation.
vnoremap < <gv
vnoremap > >gv

nnoremap <F3> :set hlsearch!<CR>

" Don't move on *
"nnoremap * *N

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"Shortcut for editing  vimrc file in a new tab (\ev for "edit vimrc")
nmap <leader>ev :tabedit ~/_vimrc<CR>

" doesn't work
"au insertleave :update<cr>

" CHECK IT OUT
" allow command line editing like emacs
"cnoremap <C-A> <Home>
"cnoremap <C-B> <Left>
"cnoremap <C-E> <End>
"cnoremap <C-F> <Right>
"cnoremap <C-N> <End>
"cnoremap <C-P> <Up>
"cnoremap <ESC>b <S-Left>
"cnoremap <ESC><C-B> <S-Left>
"cnoremap <ESC>f <S-Right>
"cnoremap <ESC><C-F> <S-Right>
"cnoremap <ESC><C-H> <C-W>

" CHECK IT OUT
" Maps to make handling windows a bit easier
"noremap <silent> <C-F9> :vertical resize -10<CR>
"noremap <silent> <C-F10> :resize +10<CR>
"noremap <silent> <C-F11> :resize -10<CR>
"noremap <silent> <C-F12> :vertical resize +10<CR>
"noremap <silent> ,s8 :vertical resize 83<CR>
"noremap <silent> ,cj :wincmd j<CR>:close<CR>
"noremap <silent> ,ck :wincmd k<CR>:close<CR>
"noremap <silent> ,ch :wincmd h<CR>:close<CR>
"noremap <silent> ,cl :wincmd l<CR>:close<CR>
"noremap <silent> ,cc :close<CR>
"noremap <silent> ,cw :cclose<CR>
"noremap <silent> ,ml <C-W>L
"noremap <silent> ,mk <C-W>K
"noremap <silent> ,mh <C-W>H
"noremap <silent> ,mj <C-W>J
"noremap <silent> <C-7> <C-W>>
"noremap <silent> <C-8> <C-W>+
"noremap <silent> <C-9> <C-W>+
"noremap <silent> <C-0> <C-W>>

set guifont=Courier_New:h18
colorscheme lucius
LuciusLight
"LuciusWhite

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost _vimrc source ~/_vimrc
 augroup END
endif


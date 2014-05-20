set langmenu=C
set helplang=en
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,koi8-r,cp1251,default,latin1
syntax on
" No silly toolbar
set guioptions-=T
set ff=unix
  
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

NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimfiler.vim'

NeoBundle 'Shougo/unite.vim'
" TODO: unused
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'vim-scripts/bufkill.vim'

NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-commentary'
" TODO: unused
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-speeddating'

NeoBundle 'derekwyatt/vim-fswitch'

NeoBundle 'Townk/vim-autoclose'

" TODO: unused
NeoBundle 'SirVer/ultisnips'

NeoBundle 'Valloric/YouCompleteMe'

" TODO: unused
NeoBundle 'vim-scripts/vimwiki'

NeoBundle 'rking/ag.vim'
NeoBundle 'milesz/ack.vim'
NeoBundle 'yegappan/grep'

" NeoBundle 'kana/vim-textobj-entire'

NeoBundle 'jonathanfilip/vim-lucius'

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set keymap=russian-jcukenwin
set iminsert=2
set imsearch=-1

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
set linebreak
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
set wildchar=<Tab>
set wildmenu

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

set nrformats= " When doing Ctrl-A/Ctrl-X, treat all numbers as base10

set history=200 " commmand-line history

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" @TODO: no hardcoding
set directory=~/vimfiles/tmp

set autowrite " Automatically save buffer before switching to another one

"Search/replace commands have /g by default, add /g to override
set gdefault

" Add the unnamed register to the clipboard
set clipboard+=unnamed

" Now escape is different, because it doesn't safe, which seems in line
" with it's more 'oh, no, no, no' feel
inoremap kj <esc>:w<CR> " seems to be best, right-to-left movement
inoremap jk <esc>:w<CR> " fallback

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

let mapleader = " "

"Opens a vertical split and switches over
nnoremap <leader>v <C-w>v<C-w>l

"Opens a horizontal split and switches over
nnoremap <leader>h <C-w>h<C-w>j

" Erase from existence
nnoremap <leader>d "_d
nnoremap <leader>dd "_dd
nnoremap <leader>D "_D
nnoremap <leader>c "_c
nnoremap <leader>cc "_cc
nnoremap <leader>C "_C
nnoremap <leader>x "_x
nnoremap <leader>X "_X

noremap <leader>ft :set filetype=

nnoremap <F2> :call RenameFile()<CR>

let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" @FIXME doesn' work
" Unite-recursive
nnoremap <leader>ur :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" Unite-file
nnoremap <leader>uf :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" Unite-history
nnoremap <leader>uh :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
" @FIXME doesn' work
" Unite-outline
nnoremap <leader>uo :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
" Unite-(yank)history
nnoremap <leader>uy :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
" Unite-buffer
nnoremap <leader>ub :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

autocmd FileType unite call s:set_unite_settings()
function! s:set_unite_settings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

" bufkill
nnoremap <leader>bd :BD<CR> " buffer delete
nnoremap <leader>bp :BB<CR> " buffer prev
nnoremap <leader>bn :BF<CR> " buffer next
nnoremap [b :BB<CR> " buffer prev
nnoremap ]b :BF<CR> " buffer next

" @TODO: change mapping to something more intuitive; now it stands for 'from here'
nnoremap <leader>fh :e %:h/

nnoremap <leader>rec :YcmForceCompileAndDiagnostics<CR>

"Shortcut for editing  vimrc file in a new tab (\ev is for "edit vimrc")
nmap <leader>ev :tabedit ~/_vimrc<CR>

" Try to commit the directory the files resides in using TortoiseSvn
" TODO: I'm sure there are much better SCM-integration plugins out there
if has("win32")
	" nmap <leader>ci gg<CR>
	nmap <leader>ci :!TortoiseProc.exe /command:commit /path:"%:h"<CR>
endif

" For vim-commentary: prefer // style comments to the default C-style
" for C++
autocmd FileType cpp set commentstring=//%s

" For ycm
" Otherwise, asks whether is should load the config file
" on every Vim start. Don't know if it's a bug or not, but
" certainly annoying
let g:ycm_confirm_extra_conf = 0

" FSwich mappings (slightly modified from Wyatt's)
" Switch to the file and load it into the current window
nmap <silent> <Leader>oh :FSHere<cr>
" Switch to the file and load it into the window on the right
nmap <silent> <Leader>or :FSRight<cr>
" Switch to the file and load it into a new window split on the right
nmap <silent> <Leader>oR :FSSplitRight<cr>
" Switch to the file and load it into the window on the left
nmap <silent> <Leader>ol :FSLeft<cr>
" Switch to the file and load it into a new window split on the left
nmap <silent> <Leader>oL :FSSplitLeft<cr>

nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Use VimFiler instead of netrw by default
let g:vimfiler_as_default_explorer = 1

" Because I'm forced to use Ack 1.x
let g:ackprg = "ack -H --nocolor --nogroup --column --smart-case --follow"

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

" @TODO: use
" Rename the current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

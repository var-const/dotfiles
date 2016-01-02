set langmenu=C
set helplang=en
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,koi8-r,cp1251,default,latin1
" No silly toolbar
set guioptions-=T
set ff=unix

set t_Co=256

" From Shougo's .vimrc
let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_mac = !s:is_windows && !s:is_cygwin
            \ && (has('mac') || has('macunix') || has('gui_macvim') ||
            \   (!executable('xdg-open') &&
            \     system('uname') =~? '^darwin'))
let s:is_linux = !s:is_windows && !s:is_cygwin && !s:is_mac

" Use English interface.
if s:is_windows
    " For Windows.
    language message en
else
    " For Linux.
    language mes C
endif

if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    if has('unix')
        set runtimepath+=~/.vim/bundle/neobundle.vim/
    else
        set runtimepath+=~/vimfiles/bundle/neobundle.vim/
    endif
endif

syntax off " seems like it should be off before the whole NeoBundle thing

" Required:
if has('unix')
    call neobundle#begin(expand('~/.vim/bundle/'))
else
    call neobundle#begin(expand('~/vimfiles/bundle/'))
endif

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'mac' : 'make -f make_mac.mak',
            \       'unix' : 'make',
            \       'cygwin' : 'make -f make_cygwin.mak',
            \    },
            \ }

NeoBundle 'Shougo/vimfiler.vim'

NeoBundle 'Shougo/unite.vim'
" TODO: unused
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'ujihisa/unite-colorscheme'

NeoBundle 'vim-scripts/bufkill.vim'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-commentary', {'autoload': {'filetypes':
        \['python','c','cpp','vim','bash','sh','zsh','objcpp','objc']
    \}}
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-fugitive'
" @TODO: breaks on C++ files if LLVM-style formatting of access modifiers is
" used:
" class Foo {
"   public:
"     void fun();
" };
" Logically, the tab width should be 4, but it gets set as 2
" NeoBundle 'tpope/vim-sleuth'
" Should check it out. Original comment:
" More interesting is the :Subvert command to use the same kind of matching for :grep or :substitute. Example:
"     The following fixes several different misspellings of "necessary": :%S/{,un}nec{ce,ces,e}sar{y,ily}/{}nec{es}sar{}/g
" We give Subvert three multimatch sections and define how each one should be replaced.
" But the kicker is that the whole word is also multimatch:
" :%S/square/rectangle/g
" That will replace Square with Rectangle, square with rectangle, SQUARE with RECTANGLE.
" Also:
" Want to turn fooBar into foo_bar? Press crs (coerce to snake_case). MixedCase (crm), camelCase (crc), snake_case (crs), and UPPER_CASE (cru) are all just 3 keystrokes away. These commands support repeat.vim.
NeoBundle 'tpope/vim-abolish'

NeoBundle 'derekwyatt/vim-fswitch'

NeoBundle 'Raimondi/delimitMate'
" Original comment: "If you are using a console version of Vim, or dealing
" with a file that changes externally (e.g. a web server log)
" then Vim does not always check to see if the file has been changed.
" The GUI version of Vim will check more often (for example on Focus change),
" and prompt you if you want to reload the file"
NeoBundle 'djoshea/vim-autoread'

" @TODO: find a fix. Right now it just garbles all C++ files, maybe due to
" updated clang
" "NeoBundle 'bbchung/clighter'

NeoBundle 'SirVer/ultisnips'

if s:is_windows
    NeoBundle 'Rip-Rip/clang_complete', {
                \ 'autoload' : {
                \     'filetypes' : ['c', 'cpp'],
                \    },
                \ }
end

" On Arch, it's managed by pacman
if s:is_mac
    NeoBundle 'Valloric/YouCompleteMe', {
                \ 'build' : {
                \   'mac' : './install.sh --clang-completer',
                \   'unix' : './install.sh --clang-completer',
                \   },
                \ 'autoload' : {
                \     'filetypes' : ['c', 'cpp', 'objc', 'objcpp', 'python'],
                \   },
                \ },
endif

" Search in files
if s:is_mac || s:is_linux
    NeoBundle 'rking/ag.vim'
endif

NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'whatyouhide/vim-gotham'
NeoBundle 'vim-scripts/xoria256.vim'
NeoBundle 'dsolstad/vim-wombat256i'
NeoBundle 'vim-scripts/wombat256.vim'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'tomasr/molokai'

NeoBundle 'vim-scripts/argtextobj.vim'

" @TODO: too wordy
NeoBundle 'vim-scripts/IndexedSearch'

NeoBundle 'vim-scripts/ReplaceWithRegister'

NeoBundle 'houtsnip/vim-emacscommandline'

" Screws up folding
" NeoBundle 'kien/rainbow_parentheses.vim'
" NeoBundle 'oblitum/rainbow' " Seems to be very slow
NeoBundle 'luochen1990/rainbow'

" For Haskell
" NeoBundle 'dag/vim2hs'

" Show a VCS diff using Vim's sign column.
NeoBundle 'mhinz/vim-signify'

" NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Yggdroot/indentLine'

NeoBundle 'ntpeters/vim-better-whitespace'

NeoBundle 'mbbill/undotree'

NeoBundle 'junegunn/vim-easy-align'

NeoBundle 'klen/python-mode', {'autoload': {'filetypes': ['python']}}

NeoBundle 'christoomey/vim-tmux-navigator'

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set keymap=russian-jcukenwin
" set iminsert=2
set iminsert=0
set imsearch=-1
" @TODO: supposed to change cursor color when keymap is changed,
" doesn't seem to work
highlight lCursor guifg=NONE guibg=Cyan

" Relative to textwidth
set colorcolumn=+1
" @FIXME supposed to highlight lines longer than the limit, doesn't work
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" language
inoremap <C-l> <C-O>:call ToggleKeymap()<CR>

" Also switch some keybindings. 'kj' is rare in English, but 'ол' is common in Russian
function! ToggleKeymap()
    " iminsert can be used to check if keymap is currently enabled (== 1) or not (== 0)
    if &iminsert == 0
        iunmap jj
        iunmap jk
        iunmap kj
        inoremap mm <esc>:w<CR>
    else
        iunmap mm
        inoremap kj <esc>
        inoremap jk <esc>
        inoremap jj <esc>:w<CR>
    endif
    call feedkeys("\<C-^>")
endfunction

" Tab stuff
" how many columns a tab counts for.
set tabstop=4
" how many columns text is indented with the reindent operations (<< and >>)
set shiftwidth=4
set softtabstop=4
" When expandtab is set, hitting Tab in insert mode will produce the appropriate number of spaces.
set expandtab

" From: https://github.com/tejr/dotfiles/blob/master/vim/vimrc
" When indenting lines with < or >, round the indent to a multiple of
" 'shiftwidth', so even if the line is indented by one space it will indent
" up to 4 and down to 0, for example
set shiftround
" Don't join lines with two spaces at the end of sentences; I don't two-space
set nojoinspaces
" Match all forms of brackets in pairs (including angle brackets)
set matchpairs=(:),{:},[:],<:>

autocmd FileType xml setlocal shiftwidth=2 tabstop=2

"Indent stuff
set smartindent

" Hybrid numbering
set number
set relativenumber

" Better line wrapping
set wrap
set linebreak
" set textwidth=99
set textwidth=80
set formatoptions=qrn1

" Set incremental searching
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

" Start scrolling when we're 10 lines away from margins
" set scrolloff=10

set encoding=utf-8

set ttyfast

" From: https://github.com/tejr/dotfiles/blob/master/vim/vimrc
" Don't bother drawing the screen while executing macros or other automated or
" scripted processes, just draw the screen as it is when the operation
" completes
set lazyredraw

set foldmethod=syntax
set foldnestmax=1 "deepest fold is 1 level
set foldlevelstart=0
" Folding doesn't seem to be a good default
set nofoldenable

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" @TODO: no hardcoding
if has('win32')
    set directory=~/vimfiles/tmp
else
    set directory=~/.vim/tmp
endif

"Search/replace commands have /g by default, add /g to override
set gdefault

" Add the unnamed register to the clipboard
if s:is_linux
    set clipboard=unnamedplus
else
    set clipboard+=unnamed
endif

" seems to be best, right-to-left movement
inoremap kj <esc>
" fallback
inoremap jk <esc>
" saves
inoremap jj <esc>:w<CR>
inoremap ZZ <esc>:wq<CR>
cnoremap kj <esc>
cnoremap jk <esc>
cnoremap jj <CR>

nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Don't move cursor when joining lines
nnoremap J mqJ`q
" Center screen on search next/prev
nnoremap n nzz
nnoremap N Nzz
nnoremap { {zz
nnoremap } }zz

" Using '<' and '>' in visual mode to shift code by a tab-width left/right by
" default exits visual mode. With this mapping we remain in visual mode after
" such an operation.
vnoremap < <gv
vnoremap > >gv

" nnoremap <F3> /abcabcabcabcabcabcabcabc<CR>

" Don't move on *
"nnoremap * *N

let mapleader = " "

"Opens a vertical split and switches over
nnoremap <leader>v <C-w>v<C-w>l
"Opens a horizontal split and switches over
nnoremap <leader>h :split<CR><C-w>j

" Erase from existence
nnoremap <leader>d "_d
nnoremap <leader>dd "_dd
nnoremap <leader>D "_D
nnoremap <leader>x "_x
nnoremap <leader>X "_X
" @TODO: these are unused. Maybe remap the key to something else?
nnoremap <leader>c "_c
nnoremap <leader>cc "_cc
nnoremap <leader>C "_C

noremap <leader>ft :set filetype=

noremap <leader>tn :tabnew<CR>
noremap <C-n> gt
noremap <C-p> gT

let g:unite_source_history_yank_enable = 1
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#matcher_default#use(['matcher_regexp'])
call unite#filters#matcher_default#use(['matcher_glob'])
" @FIXME doesn't work
" Filesystem-recursive
" nnoremap <leader>ur :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>fr :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" Filesystem-file
nnoremap <leader>ff :<C-u>Unite -no-split -buffer-name=files   -start-insert file file_rec/async file/new<cr>
" Filesystem-history
nnoremap <leader>fh :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
" Filesystem-outline
nnoremap <leader>fo :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
" Filesystem-(yank)history
nnoremap <leader>fy :<C-u>Unite -no-split -buffer-name=yank    -start-insert history/yank<cr>
" Filesystem-(register)history
nnoremap <leader>f8 :<C-u>Unite -no-split -buffer-name=register    -start-insert register<cr>
nnoremap <leader>f* :<C-u>Unite -no-split -buffer-name=register    -start-insert register<cr>
" Filesystem-buffer
nnoremap <leader>fb :<C-u>Unite -no-split -buffer-name=buffer  -start-insert buffer_tab buffer<cr>
" Filesystem-current directory
nnoremap <silent><leader>fc :<C-u>UniteWithBufferDir
            \ -buffer-name=files -no-split -start-insert buffer file file/new<CR>
" Filesystem-booKmarks
nnoremap <leader>fk :<C-u>Unite -no-split -buffer-name=bookmark  -start-insert bookmark<cr>
nnoremap <leader>fg :<C-u>Unite -no-split -buffer-name=unite-grep  -start-insert grep:.<cr>
nnoremap <leader>fj :<C-u>Unite -no-split -buffer-name=unite-grep  -start-insert jump<cr>
nnoremap <leader>fclr :<C-u>Unite -no-split -buffer-name=unite-grep  -start-insert colorscheme<cr>
nnoremap <leader>fd :e %:h<cr>

if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
                \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
endif

autocmd FileType unite call s:set_unite_settings()
function! s:set_unite_settings()
    nmap <buffer> <ESC> <Plug>(unite_exit)
    nmap <buffer> <Tab> <Plug>(unite_narrowing_path)
    imap <buffer> <Tab> <Plug>(unite_narrowing_path)
endfunction

let g:better_whitespace_filetypes_blacklist=['unite','mail']

" bufkill
nnoremap <leader>bd :BD<CR> " buffer delete

" @TODO: map now unused <leader><leader> keymap

nnoremap <leader>rec :YcmForceCompileAndDiagnostics<CR>

" Shortcut for editing  vimrc file in a new tab (\ev is for "edit vimrc")
if has('unix')
    nnoremap <leader>ev :tabedit ~/dotfiles/vim/.vim/.vimrc<CR>
else
    nnoremap <leader>ev :tabedit ~/_vimrc<CR>
endif

" For vim-commentary: prefer // style comments to the default C-style
" for C++
autocmd FileType cpp set commentstring=//%s

" For ycm
" Otherwise, asks whether is should load the config file
" on every Vim start. Don't know if it's a bug or not, but
" certainly annoying
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'

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

" Instead of built-in command which opens help for word under cursor
nnoremap K :YcmCompleter GoTo<CR>

" append
nnoremap <leader>app :w! >>

" Use VimFiler instead of netrw by default
let g:vimfiler_as_default_explorer = 1

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

set guifont=DejaVuSansMono\ 15
colorscheme lucius
LuciusLight
" LuciusDark
"LuciusWhite

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
    augroup myvimrchooks
        au!
        if has('unix')
            autocmd bufwritepost .vimrc source ~/.vimrc
        else
            autocmd bufwritepost _vimrc source ~/_vimrc
        endif
    augroup END
endif

" @TODO: need to unmap this default mapping, screws up window switching <C-l>           <Plug>(vimfiler_redraw_screen)

let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsListSnippets ="<s-tab>"
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
                return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsSnippetDirectories = ["custom-ulti-snippets", "UltiSnips"]

" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

if s:is_cygwin
    let g:clang_auto_user_options='path, .clang_complete'
    " let g:clang_exec='"clang'
    " let g:clang_user_options='2>/dev/null || exit 0'
    let g:clang_complete_auto = 0
    let g:clang_complete_copen = 1
    " let g:clang_library_path ='C:\Program Files\LLVM\bin'
    let g:clang_library_path ='/cygdrive/c/Program Files/LLVM/bin'
    " let g:clang_user_options='|| exit 0'
    " let g:clang_auto_user_options='|| exit 0"'
    " let g:clang_snippets_engine='clang_complete'
    " if there's an error, allow us to see it
    " let g:clang_complete_copen=1
    " let g:clang_complete_macros=1
    " let g:clang_complete_patterns=0
    " fix cygwin shell redirection
    " set shellredir=>\\"%s\\"\\ 2 > &1
    " set shellredir='>%s\ 2>&1'
    " set shellredir=>\"%s\"\ 2>&1
    " set shellredir=>\"%s\"\ 2>/dev/null
endif

set shell=zsh\ -l

" Add a commented-out copy above
nmap <leader>yy mtyyP<Plug>CommentaryLine`t

let g:rainbow_active = 1

let g:rainbow_conf = {
            \  'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \  'ctermfgs': ['darkgray', 'darkblue', 'darkmagenta', 'darkcyan', 'darkred', 'darkgreen'],
            \}
" Stolen from: http://stackoverflow.com/questions/9403098/is-it-possible-to-jump-to-closed-folds-in-vim
" Goes to next _closed_ fold, skipping the open folds, unlike the default.
" @TODO: make default available via leader key
nnoremap <silent> zj :call NextClosedFold('j')<cr>
nnoremap <silent> zk :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

" @TODO: check it out
" http://www.reddit.com/r/vim/comments/1yfzg2/does_anyone_actually_use_easymotion/
cnoremap ?t <CR>:t''<CR>
cnoremap ?T <CR>:T''<CR>
cnoremap ?m <CR>:m''<CR>
cnoremap ?M <CR>:M''<CR>
cnoremap ?d <CR>:d<CR>``

let g:indentLine_faster = 1

" Extend our undoable steps and preserve over restart (if available)
if has('persistent_undo')
    set undodir=$TMPDIR,~/tmp,~/.vim/tmp,/tmp,/var/tmp
    set undofile
    set undoreload=10000
end
set undolevels=10000
" UndoTree
nmap <leader>u :UndotreeToggle<CR>

set list lcs=tab:\|\ 

" @TODO: an easy way to modify zz would be to just call zz followed by several
" Ctrl-Y's

" :hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" :hi CursorLine   cterm=NONE ctermbg=white ctermfg=black
:hi CursorLine   cterm=NONE ctermbg=white
" :hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" :nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
set cursorline
:nnoremap <Leader>c :set cursorline!<CR>

" @FIXME need a better mapping
nmap <Up> <C-W>+
nmap <Down> <C-W>-
nmap <Left> <C-W>>
nmap <Right> <C-W><

" set notimeout
set timeout
set ttimeout
set timeoutlen=500
set ttimeoutlen=10
set noesckeys

" 'Clighter searches libclang-3.5 in your system automatically.
" You must set this option when clighter cannot find libclang, or other version of libclang is used.'
" On Ubuntu, We're using 3.6, so let's provide the path explicitly
" let g:clighter_libclang_file = '/usr/lib/x86_64-linux-gnu/libclang-3.6.so'
" @TODO: differentiate between Arch and Ubuntu
let g:clighter_occurrences_mode = 1

" " Free functions
hi link clighterDeclRefExprCall Function
hi link clighterFunctionDecl Function

" " Enums
" hi link clighterEnumDecl Identifier
" hi link clighterEnumConstantDecl Constant
" hi link clighterDeclRefExprEnum Constant

" hi link clighterMacroInstantiation Constant
" hi link clighterPrepro PreProc

" Member variable and method calls
hi link clighterMemberRefExprCall Function

" " Not working
" hi link clighterMemberRefExprVar Error

" " namespace { ... }
" hi link clighterNamespace Constant
" hi link clighterNamespaceRef Constant

" hi link clighterOccurrences IncSearch

" " Templated types
" hi link clighterTemplateRef Type

" " References to templated types
" hi link clighterTypeRef Type

" " The 'T' in template <class T>
" hi link clighterTemplateTypeParameter Type

" " class/struct declarations
" hi link clighterClassDecl None
" hi link clighterStructDecl None

" " 'using name = ...' statements
" hi link clighterDecl None

" " Class member variable declarations
" hi link clighterFieldDecl None

" " Function parameters, including the template types
" hi link clighterParmDecl None

" " Lambda campture variables, using std::name statements
" hi link clighterRef None

" hi link clighterUnionDecl None

" " Local variables
" hi link clighterVarDecl None

" let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pep257']
" let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe']
" All these rebindings don't work for some reason
" let g:pymode_run_bind = '<leader>pr'
" let g:pymode_run_bind = '<leader>q'
" let g:pymode_breakpoint_bind='<leader>e'

let g:pymode_lint_ignore = ''
" Sort errors: E errors first, then warnings, etc.
let g:pymode_lint_sort = ['E', 'C', 'I']
" let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = '⚠'
" let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = '✗'
" let g:pymode_lint_info_symbol = 'II'
" let g:pymode_lint_pyflakes_symbol = 'FF'

let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" Fugitive mappings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gc :Gcommit --verbose<CR>
nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>gb :Gblame<CR>

" Write with superuser permissions
cmap w!! w !sudo tee %

" @TODO: gre works, but grE doesn't (insert and replace)

let g:neomru#file_mru_ignore_pattern =
            \ '\~$\|\.\%(o\|exe\|dll\|bak\|zwc\|pyc\|sw[po]\)$'.
            \ '\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)'.
            \ '\|^\%(\\\\\|/temp/\|/tmp/\|\%(/private\)\=/var/folders/\)'.
            \ '\|\%(^\%(fugitive\)://\)'

let g:neomru#directory_mru_ignore_pattern = '\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)'.
            \ '\|^\%(\\\\\|/temp/\|/tmp/\|\%(/private\)\=/var/folders/\)'

autocmd FileType text,gitcommit setlocal spell
set spelllang=en_us,ru_ru
set complete+=kspell

" Autosave each time text is changed in normal mode or each time we leave insert
" mode. No more saving-related headaches.
" Don't autosave git commit message, because once it's saved, Fugitive thinks
" the commit should go through
" Don't autosave in git diff mode, something prevents vim from automatically
" saving the staged file. @TODO: find out the reason
autocmd InsertLeave,TextChanged * if &filetype != 'gitcommit' && expand('%') != '' && expand('%:h') !~ 'fugitive' | update | endif
set autowrite " Automatically save buffer before switching to another one

" Swap two mark-jumping bindings. My default use-case is to go to the exact mark
" position, not the beginning of the line.
nnoremap ' `
nnoremap ` '

" I use line selection more often, so let's make that the default
nnoremap v V
nnoremap V v
vnoremap v V
vnoremap V v

" I go to the first non-whitespace character a lot more often
nnoremap 0 ^
nnoremap ^ 0

" From https://github.com/junegunn/dotfiles/blob/master/vimrc
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv

" @TODO: comment
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

" let terminal resize scale the internal windows
autocmd VimResized * :wincmd =

" expands %% to current file's directory in command-line mode
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

" @TODO: curious mapping, see if it's useful
" visually select the last paste or change
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" @TODO: figure out a better mapping
" Switch to last buffer
nnoremap <BS> :b#<CR>

" Return cursor to previous location on load:
autocmd BufReadPost * if &filetype != 'gitcommit' && expand('%:h') !~ 'fugitive' | normal `"

:set guioptions-=m  " remove menu bar
:set guioptions-=T  " remove toolbar
:set guioptions-=r  " remove right-hand scroll bar
:set guioptions-=L  " remove left-hand scroll bar

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
" @FIXME doesn't seem to work
nnoremap <M-\> :TmuxNavigatePrevious<cr>

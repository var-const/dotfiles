setopt EXTENDED_GLOB

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

fpath=(~/zsh-completions/src $fpath)

export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR=vim
export VISUAL=vim
export BROWSER=firefox

export PASSWORD_STORE_DIR=/home/vk/en/.password-store
export PASSWORD_STORE_CLIP_TIME=20

export BSPWM_STATE=/tmp/bspwm-state.json

# http://chneukirchen.org/blog/category/zsh.html
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[," copy-earlier-word

# http://blog.viktorkelemen.com/2012/10/retrieving-results-of-last-command-in.html
zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey "^o" insert-last-command-output

# -2 arg to tmux means "Use 256 colors w/o trying to guess whether
# they're available or not" (this guessing seems to fail under
# some terminals, mintty in particular)
if [[ -n $DISPLAY ]] && command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux -2 attach
fi

export TERM=screen-256color

# To get fasd working in a shell, some initialization code must be run
eval "$(fasd --init auto)"

# @FIXME remove partially-absolute path (dotfiles)
OS_NAME=$(~/dotfiles/get-os.sh)
DISTRO_NAME=""
if [[ $OS_NAME == "linux" ]]; then
    DISTRO_NAME=$(~/dotfiles/get-distro-name.sh)
fi
case $OS_NAME in
  cygwin)
	# export CC=/usr/bin/clang.exe
	# export CXX=/usr/bin/clang++
	set LC_ALL=ru_RU.UTF-8
	export LESS="-R"
	export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
    ;;
  linux)
	# export CC=/usr/bin/gcc-4.9
	# export CXX=/usr/bin/g++-4.9
	# export CC=/usr/bin/clang
	# export CXX=/usr/bin/clang++
    case $DISTRO_NAME in
        arch)
            export CC=clang
            export CXX=clang++
            ;;
        ubuntu)
            export CC=clang-3.6
            export CXX=clang++-3.6
            ;;
    esac
	# export LESS="-R"
	# export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
    export PAGER=/usr/bin/vimpager
    ;;
esac

# ls automatically after changing dirs
function chpwd() {
    emulate -L zsh
    ls -A
}

# Very cool - allows to always run Vim in a single instance and
# automatically open new files from shell in this instance.
# Stolen from: http://vim.wikia.com/wiki/Enable_servername_capability_in_vim/xterm
# Original comments follow:
# "Function for always using one (and only one) vim server, even when not
# using gvim.
# If you really want a new vim session, simply do not pass any
# argument to this function"
# @TODO: make work. At the very least, the vim currently installed doesn't have clientserver
# functionality
# function vim {
#   vim_orig=$(which 2>/dev/null vim)
#   if [ -z $vim_orig ]; then
#     echo "$SHELL: vim: command not found"
#     return 127;
#   fi
#   $vim_orig --serverlist | grep -q VIM
#   # If there is already a vimserver, use it
#   # unless no args were given
#   if [ $? -eq 0 ]; then
#     if [ $# -eq 0 ]; then
#       $vim_orig
#     else
#       $vim_orig --remote "$@"
#     fi
#   else
#     $vim_orig --servername vim "$@"
#   fi
# }

# From prezto. Original comment:
# "Ensure that a non-login, non-interactive shell has a defined environment"
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

# I want to copy directories too, for chrissake
alias cpdv="rsync -rpoghb --backup-dir=/tmp/rsync -e /dev/null --progress --"

alias lessh='LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s" less -M '

# @FIXME remove partially-absolute path (dotfiles)
OS_NAME=$(~/dotfiles/get_os.sh)
case $OS_NAME in
  cygwin)
	alias open="cygstart"
	alias ack='/cygdrive/c/strawberry/perl/site/bin/ack'
    ;;
  darwin)
	alias vim='mvim -v'
	;;
  linux)
	alias open="xdg-open"
	;;
esac

alias t='cd ~/worklog && worklog && cd -'

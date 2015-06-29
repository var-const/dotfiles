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
alias v='f -e vim'       # quick opening files with vim
alias zat='f -e zathura' # quick opening files with zathura

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

# svn
alias svn-st-imm="svn st --depth files"
alias svn-st-vers="svn st | grep '^[M|D|A]'"
alias svn-st-vers-imm="svn st | grep '^[M|D|A]' --depth files"
alias svn-mk-patch="svn diff --diff-cmd /usr/bin/diff -x \"-i -b\""

alias rsy="rsync-copy"

# Should be unnecessary because of utility module in prezto
# alias du="du -h"

alias shut="systemctl poweroff"
alias reb="systemctl reboot"
alias susp="systemctl suspend"

alias aria-movie='aria2c --dir=/mnt/double/movies'
alias aria-got='aria2c --dir=/mnt/double/movies/game-of-thrones'
alias aria-prog-book='aria2c --dir=/mnt/double/prog-books'
alias aria-book='aria2c --dir=/mnt/double/books'
alias aria-music='aria2c --dir=/mnt/double/music'
alias aria-mp3='aria2c --dir=/mnt/double/music/mp3'
alias aria-game='aria2c --dir=/mnt/double/games'
alias aria-cwd='aria2c --dir=.'

alias mpv='mpv --no-audio-display'

alias cv='cv -w'

alias less=$PAGER
alias zless=$PAGER

svn-log-user() {
	username="$1"
	args="${@:2}"
	# echo "$args"
	# svn log "$args" | sed -n "/\"$username\"/,/-----$/ p"
	svn log "$args" | sed -n "/$username/,/-----$/ p"
}
svn-log-user-period() {
	username="$1"
	shift="$2"
	prev_date="$(date '+%Y-%m-%d %H:%M' --date today$shift)"
	today="$(date '+%Y-%m-%d %H:%M')"
	svn log -vr \{"$prev_date"\}:\{"$today"\} | sed -n "/$username/,/-----$/ p"
}

# From prezto. Original comment:
# "Ensure that a non-login, non-interactive shell has a defined environment"
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
if [[ -n $(command -v gcert) ]]; then
  source "$HOME"/work-dotfiles/zsh/.zshenv
fi

# @FIXME too many aliases for a single program
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
# alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
# alias v='f -e vim'       # quick opening files with vim
# alias zat='f -e zathura' # quick opening files with zathura

# I want to copy directories too, for chrissake
alias cpdv="rsync -rpoghb --backup-dir=/tmp/rsync -e /dev/null --progress --"

alias lessh='LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s" less -M '

# @FIXME remove partially-absolute path (dotfiles)
OS_NAME=$(~/dotfiles/get-os.sh)
case $OS_NAME in
  cygwin)
	alias open="cygstart"
	alias ack='/cygdrive/c/strawberry/perl/site/bin/ack'
    ;;
  darwin)
	alias vim='mvim -v'
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
alias aria-here='aria2c --dir=.'
alias ydl='youtube-dl'
alias ydl-prog='youtube-dl --output "/mnt/double/prog-vids/%(title)s.%(ext)s"'

alias mpv='mpv --no-audio-display'
alias cv='cv -w'

# Quick config editing aliases
# zsh
alias czr='vim ~/dotfiles/zsh/.zshrc && ~/dotfiles/zsh/.zshrc && rehash'
alias szr='source ~/dotfiles/zsh/.zshrc'
alias cze='vim ~/dotfiles/zsh/.zshenv && source ~/dotfiles/zsh/.zshenv && rehash'
alias sze='source ~/dotfiles/zsh/.zshenv'
alias cza='vim ~/dotfiles/zsh/.*'
# vim
alias cv='vim ~/dotfiles/vim/.vim/.vimrc'
# email
alias cmutt='vim ~/dotfiles/mutt/.mutt/*muttrc'
alias cofflineimap='vim ~/dotfiles/offlineimap/.offlineimaprc'
# qutebrowser
alias cq='vim ~/dotfiles/qutebrowser/.config/qutebrowser/qutebrowser.conf'
alias cqk='vim ~/dotfiles/qutebrowser/.config/qutebrowser/keys.conf'
# x
alias cx='vim ~/dotfiles/x/.xinitrc'
# DE
alias cw='vim ~/dotfiles/bspwm/.config/bspwm/bspwmrc'
alias cwk='vim ~/dotfiles/bspwm/.config/sxhkd/sxhkdrc'
alias cwa='vim ~/dotfiles/bspwm/.config/sxhkd/sxhkdrc ~/dotfiles/bspwm/.config/bspwm/bspwmrc'
# tmux
alias ct='vim ~/dotfiles/tmux/.tmux.conf'

O()
{
    nohup xdg-open "$@" > /dev/null 2>&1 &
    disown
}

dus()
{
    du -sh -- "$@" | sort -h
}

alias -g S='| sort'
alias -g G='| grep'
alias -g N="> /dev/null 2>&1"
alias -g NN="2> /dev/null"
alias -g F='| fzf'

alias v='vim'
alias c='cd'
alias c-='cd -'
alias md='mkdir'
alias y='yaourt'
alias lal='ls -Al'
alias chx='chmod +x'

alias less=$PAGER
alias zless=$PAGER

alias py='python'

alias mnt='mount'
alias umnt='umount'

alias tmux='tmux -2'
alias t='tmux'
alias tl='tmux ls'
alias tk='tmux kill-session -t'
alias ta='tmux attach-session -t'
alias td='tmux detach'
alias tn='tmux new -s'
alias tb='tmux bind -n'
alias trenw='tmux rename-window'
alias trens='tmux rename-session'
alias muxs='tmuxinator start'
alias muxn='tmuxinator new'

alias zregen='rm -f ~/.zgen/init.zsh'

mdj () {
    last=${@[-1]}
    mkdir $* && cd "$last"
}

ff() {
  find . -iname "*$1*"
}

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

alias rn=ranger

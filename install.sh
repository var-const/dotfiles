#!/bin/sh

# Thanks to SO: http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
os=$($wd/get-os.sh)

# Main workflow
stow bspwm
stow git
stow termite
stow tmux
stow tmuxinator
# @TODO: create vim's undo and backups directories
stow vim
mkdir "$HOME"/.vim/{backups,tmp}
stow vimpager
stow x
stow zathura
stow zsh

# Multimedia
stow aria2
stow mps-youtube
stow mpv
stow qutebrowser
stow youtube-dl
# @TODO: wine

# Email
stow goobook
stow msmtp
stow mutt
stow notmuch
stow offlineimap

# Legacy
stow bash
stow mercurial
stow svn

if [[ "$os" == "cygwin" ]]; then
    stow ack
    stow mintty
    stow ncftp
    stow pentadactyl
fi

if [[ -e /etc/arch-release ]]; then
    stow archey3
fi

./install-vim-neobundle.sh

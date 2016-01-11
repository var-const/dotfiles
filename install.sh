#!/bin/sh

# Thanks to SO: http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
os=$($wd/get-os.sh)

stow aria2
stow bspwm
stow git
stow goobook
stow mps-youtube
stow mpv
stow qutebrowser
stow termite
stow tmux
stow tmuxinator
# @TODO: create vim's undo and backups directories
stow vim
stow vimpager
stow x
stow youtube-dl
stow zathura
stow zsh

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

#!/bin/sh

# Thanks to SO: http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
wd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
os=$($wd/get_os.sh)

stow ack
stow archey3
stow bash
stow bspwm
stow git
stow mercurial
if [ "$os" == "cygwin" ]; then
    stow mintty
    stow ncftp
fi
stow pentadactyl
stow svn
stow termite
stow tmux
stow vim
stow vimpager
stow x
stow zsh

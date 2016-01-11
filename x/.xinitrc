#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# This version causes garbage output when tabbing through a list of files in zsh,
# try tabbing through BSG's season 4
# compton -b --backend glx --vsync opengl-swc --paint-on-overlay
compton -b --backend glx --vsync opengl-swc

if [[ -z $(pidof xcape) ]]; then
    setxkbmap -model pc104 -layout us,ru -option grp:alt_shift_toggle

    spare_modifier="VoidSymbol"

    xmodmap -e "keycode 36 = $spare_modifier"
    xmodmap -e "remove mod4 = $spare_modifier"
    xmodmap -e "add Control = $spare_modifier"
    xmodmap -e "keycode any = Return"

    xcape -t 200 -e "$spare_modifier=Return;Control_L=Escape"
fi

sxhkd &
unclutter &
feh --randomize --bg-fill ~/wallpapers/* &
exec "$HOME"/dotfiles/bin/loop-bspwm.sh

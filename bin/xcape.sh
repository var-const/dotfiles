#!/bin/sh

if [[ -z $(pidof xcape) ]]; then
    # setxkbmap -model pc104 -layout us,ru -option grp:alt_shift_toggle
    setxkbmap -model pc104 -layout us,ru -option grp:shifts_toggle

    spare_modifier="VoidSymbol"

    xmodmap -e "keycode 36 = $spare_modifier"
    xmodmap -e "remove mod4 = $spare_modifier"
    xmodmap -e "add Control = $spare_modifier"
    xmodmap -e "keycode any = Return"

    xcape -t 200 -e "$spare_modifier=Return;Control_L=Escape"
fi


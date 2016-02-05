#!/bin/sh

if [[ -z $(pidof xcape) ]]; then
    setxkbmap -model pc104 -layout us,ru -option grp:shifts_toggle

    spare_modifier="Hyper_L"
    # Trigger Hyper_L when keycode 36 (Enter) is sent (pressed)
    xmodmap -e "keycode 36 = $spare_modifier"
    # And make Hyper_L not act as mod4, like it normally does...
    xmodmap -e "remove lock = Caps_Lock" # @TODO: figure out why this is needed on Ubuntu. Has to do something with remapping of Caps_Lock to Control via gui
    xmodmap -e "remove mod4 = $spare_modifier"
    # ...but as control
    xmodmap -e "add Control = $spare_modifier"

    # Original comment: map space to an unused keycode (to keep it around for
    # xcape to use)
    xmodmap -e "keycode any = Return"
    # Original comment: finally use xcape to cause the space bar to generate
    # a space when tapped.
    xcape -t 200 -e "$spare_modifier=Return;Control_L=Escape;Caps_Lock=Escape"
    # So, the whole chain is:
    # keycode -> keysym -> modifier, or
    # 36 -> mod4 -> Hyper_L/Control
fi

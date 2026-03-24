#!/bin/sh

case "$1" in
    on)
        swaymsg 'output eDP-1 disable'
        # swaymsg 'input type:keyboard xkb_options "caps:ctrl_modifier,grp:rctrl_rshift_toggle,altwin:swap_lalt_lwin"'
        ;;
    off)
        swaymsg 'output eDP-1 enable'
        # swaymsg 'input type:keyboard xkb_options "caps:ctrl_modifier,grp:rctrl_rshift_toggle"'
        ;;
esac

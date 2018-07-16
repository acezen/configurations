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
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# backgroug light
#sudo echo > /sys/class/backlight/intel_backlight/brightness

# Set the locale for X-windows
export LANG=zh_CN.UTF-8
export LC_COLLATE=C
export LC_TIME=en_US.UTF-8
export LC_MESSAGES=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US

# Set the input method
export XIM=fcitx 
export XIM_PROGRAM=fcitx 
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
fcitx -d&

# Mutil windows manager
session=${1:-dwm}

case $session in
    dwm             ) exec startdwm;;
    xfce|xfce4      ) exec startxfce4;;
    # No known session, try to run it as default
    *               ) exec $1;;
esac

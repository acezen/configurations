#/bin/bash

#### dependencies:
# 1) feh --> background
# 2) alsamix --> audio infos
# 3) acpi --> battery infos
# 4) ifconfig --> networkinfos

#### infos:
# 1) updates all 0.5 seconds 
#                --> volume and battery state in the statusbar updates only all 0.5 seconds --> easy editable
#                --> update time is not in syc with the system time --> seconds display may look laggy
# 2) network is looking for the strings 'eth0' and 'wlan0' --> easy editable

habak -ms ~/.dwm/wallpaper.jpg
wmname LG3D

while true
do
   battery=$(acpi -b | cut -d"," -f2 | cut -d" " -f2)
#   ip=$(ifconfig eth0| grep "inet A"|cut -d: -f2 | cut -d" " -f 1)
#   ip="eth0:${ip}"
   vol=$(amixer get Master | egrep "^  Mono"| cut -d"[" -f 2 | cut -d"%" -f 1)
   vol="${vol}%"
   mute=$(amixer get Master | egrep "^  Mono"| cut -d"[" -f 4 | cut -d"]" -f 1)
   capLock=$(xset -q | egrep "Caps Lock" | cut -d":" -f 3 | cut -d" " -f 4)

#   tmp="eth0:"
#   if [ "$ip" = "$tmp" ]
#       then
#          ip=$(ifconfig wlan0| grep "inet A"|cut -d: -f2 | cut -d" " -f 1)
#        ip="wlan0:${ip}"
#   fi
#   tmp="off"
   if [ "$mute" = "$tmp" ]
        then
        vol="mute"
   fi
   xsetroot -name "CapsLock:$capLock  vol:$vol  bt:$battery  $ip  $(date +"%F %a %H:%M")"
   sleep 10    # Update time
done &
fcitx &

exec dwm

#! /usr/bin/env bash

old_charge=$(cat /sys/class/power_supply/BAT1/charge_now)
old_sign=$'+'
while true; do

TIME=$(date +"%A, %B %d | %H:%M")
BATTERY=$(cat /sys/class/power_supply/BAT1/capacity)



new_charge=$(cat /sys/class/power_supply/BAT1/charge_now)



#python ~/programming/batstat/batstat.py > ~/programming/batstat/chrg_sign.txt
#charge=$(cat ~/programming/batstat/chrg_sign.txt)
#charge_level=$(($new_charge-$old_charge))

if [ "$new_charge" -gt "$old_charge" ]

then
    charge=$'+'

elif [ "$new_charge" -lt "$old_charge" ]
then
    charge=$'-'

else
    charge=$old_sign
fi

xsetroot -name "$TIME | Battery: $BATTERY$charge"

#echo $charge_level >~/programming/batstat/chrg_level.txt

old_charge=$new_charge
old_sign=$charge

sleep 5



done &

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

exec dwm

#exec mate-session
##exec awesome

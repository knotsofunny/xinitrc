#! /usr/bin/env bash

#NOTE: use "github" instead of "origin" when doing git commands

old_charge=$(cat /sys/class/power_supply/BAT1/charge_now) #Creating variables to have for first loop
old_sign=$'+'

while true; do

TIME=$(date +"%A, %B %d | %H:%M")
BATTERY=$(cat /sys/class/power_supply/BAT1/capacity)


new_charge=$(cat /sys/class/power_supply/BAT1/charge_now)


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

old_charge=$new_charge
old_sign=$charge #Saves last charge in case of charge level not changing between loops.

sleep 5

done &

export GTK_IM_MODULE=ibus #not sure if these are needed
export XMODIFIERS=@im=ibus #Keeping  them for now
export QT_IM_MODULE=ibus

exec dwm

#exec mate-session

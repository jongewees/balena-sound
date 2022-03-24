#!/usr/bin/env bash

if [[ -n "$SOUND_DISABLE_BLUETOOTH" ]]; then
  echo "Bluetooth is disabled, exiting..."
  exit 0
fi

#LET OP: geen spatie tussen remount en rw, dus 'remount,rw' ipv 'remount, rw'
#LET OP: remounten van folders kan alleen als ze al een keer gemount zijn, dus wel /lib/firmware maar niet /lib/firmware/rtl_bt/
#Als het remounten niet lukt, krijg je tijdens het deployen van de image op de device fouten als 'can´t create rtl8761b_fw.bin' 
mount -o remount,rw /lib/firmware

#set MOUNTCMD=mount -o remount, rw /
#echo $($MOUNTCMD> everything.txt 2>&1)

mkdir -p /lib/firmware/rtl_bt/

cp /usr/src/lib/rtl8761b_fw.bin /lib/firmware/rtl_bt/

cp /usr/src/lib/rtl8761b_config.bin /lib/firmware/rtl_bt/

exec /usr/src/bluetooth-agent
#!/usr/bin/env bash

if [[ -n "$SOUND_DISABLE_BLUETOOTH" ]]; then
  echo "Bluetooth is disabled, exiting..."
  exit 0
fi

#NOTE:
# no space between remount and rw, so 'remount,rw' instead of 'remount, rw'
# remounting folders is only possible when they have been mounted before, so you can mount /lib/firmware but not /lib/firmware/rtl_bt/
# if mounting fails, errors during deployment of the image will be like 'cannot create rtl8761b_fw.bin' 
mount -o remount,rw /lib/firmware

#set MOUNTCMD=mount -o remount, rw /
#echo $($MOUNTCMD> everything.txt 2>&1)

mkdir -p /lib/firmware/rtl_bt/

cp /usr/src/lib/rtl8761b_*.bin /lib/firmware/rtl_bt/

exec /usr/src/bluetooth-agent
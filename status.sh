#! /bin/bash

echo "-------"
echo "Temp"
echo "-------"
sudo sensors coretemp-isa-0000
sudo hddtemp /dev/sdb
sudo hddtemp /dev/sdc

echo "-------"
echo "Battery"
echo "-------"
sudo upower -i /org/freedesktop/UPower/devices/battery_BAT0


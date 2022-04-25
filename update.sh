#!/bin/bash

clear

echo -e "=== Updating ==="
sudo apt update

echo -e "\n=== Upgrading ==="
sudo apt full-upgrade -y

echo -e "\n=== Cleaning ==="
sudo apt autoremove -y
sudo apt autoclean -y

echo -e "\n=== Rebooting if required ==="
[ -f /var/run/reboot-required ] && sudo reboot -f

echo -e "\n=== Done ==="


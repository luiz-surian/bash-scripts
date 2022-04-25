#!/bin/bash

echo "Updating Firewall rules"
echo -e "==+==\n"

echo "Clearing current rules"
echo -e "=====\n"
sudo ufw disable
yes | sudo ufw reset

echo "Adding External Rules"
echo -e "=====\n"
sudo ufw allow 80 comment "HTTP"
sudo ufw allow 443 comment "HTTPS"
sudo ufw allow 5900 comment "VNC Server"
sudo ufw allow 53999 comment "WireGuard VPN"

echo -e "\nAdding Local Rules"
echo -e "=====\n"
local_rules () {
	echo "Adding rules for $1 ($2)"
	sudo ufw allow from $2 to any port 22 proto tcp comment "SSH ($1)"
	sudo ufw allow from $2 to any port 81 proto tcp comment "Nginx Proxy Manager - Admin ($1)"
	sudo ufw allow from $2 to any port 1337 proto tcp comment "File Browser ($1)"
	sudo ufw allow from $2 to any port 2202 proto tcp comment "Ubooquity ($1)"
	sudo ufw allow from $2 to any port 2203 proto tcp comment "Ubooquity - Admin ($1)"
	sudo ufw allow from $2 to any port 3306 proto tcp comment "MariaDB ($1)"
	sudo ufw allow from $2 to any port 5005 proto tcp comment "Flame ($1)"
	sudo ufw allow from $2 to any port 7580 proto tcp comment "ProjectSend ($1)"
	sudo ufw allow from $2 to any port 9443 proto tcp comment "Portainer ($1)"
	sudo ufw allow from $2 to any port 51821 proto tcp comment "Wireguard VPN - Admin ($1)"
	echo -e "=====\n"
}

local_rules IPv4 "192.168.75.0/24"
local_rules IPv6 "2804:431:e03d:1101::/64"
local_rules Docker "172.0.0.0/8"

echo "Enabling Firewall"
echo -e "=====\n"
yes | sudo ufw enable
sudo ufw status verbose

echo "Done"
echo -e "==+==\n"

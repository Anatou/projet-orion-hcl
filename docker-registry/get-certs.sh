#!bin/bash

# Script pour la machine client
echo "Sur la machine du registry, taper:"
echo "nc -v {ip-client} 4444 < certs/registry.local.crt"
ip a | grep "inet "
echo "Faire Ctrl+C après réception de certs.crt"
nc -lv -p 4444 > certs.crt

sudo apt install ca-certificates
sudo cp certs.crt /usr/local/share/ca-certificates
sudo update-ca-certificates
if [ "$(id -u)" = "0" ]; then
	systemctl restart docker
else
	systemctl --user restart docker
fi
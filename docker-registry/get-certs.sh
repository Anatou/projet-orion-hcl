#!bin/bash

# Get certs
echo "Sur la machine du registry, taper:"
echo "nc -v {ip-client} 4444 < certs/registry.local.crt"
echo "This machine's IPs :"
ip a | grep "inet "
bash -i -c "nc -lv -w 2 -p 4444 > certs.crt -e true"

# Trust certificate
sudo apt install ca-certificates
sudo cp certs.crt /usr/local/share/ca-certificates
sudo update-ca-certificates
if [ "$(id -u)" = "0" ]; then
	systemctl restart docker
else
	systemctl --user restart docker
fi
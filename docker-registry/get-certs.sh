#!bin/bash

# Get certs
echo "Sur la machine du registry, taper:"
echo "nc -v {ip-client} 4444 < certs/registry.local.crt"
echo "This machine's IPs :"
ip a | grep "inet "
nc -lv -p 4444 > certs.crt -q 1

# Trust certificate
sudo apt install ca-certificates
sudo cp certs.crt /usr/local/share/ca-certificates
sudo update-ca-certificates
sudo systemctl restart docker
#!/bin/bash

mkdir -p ./registry/data
mkdir ./certs
sudo apt install -y apache2-utils

# Create login credentials
# Please setup $user and $psswd beforehand
htpasswd -Bbn $user $psswd > ./registry/registry.password

# Create a self-signed certificate
openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
	-keyout certs/registry.local.key \
	-out certs/registry.local.crt \
	-subj "/CN=registry.local" \
	-addext "subjectAltName=DNS:registry.local"

sudo apt install -y ca-certificates
sudo cp certs/registry.local.crt /usr/local/share/ca-certificates
sudo update-ca-certificates

# If root, restart differently
if [ "$(id -u)" = "0" ]; then
	systemctl restart docker
else
	systemctl --user restart docker
fi

wget https://github.com/Anatou/projet-orion-hcl/raw/refs/heads/main/docker-registry/compose.yaml
docker compose up -d
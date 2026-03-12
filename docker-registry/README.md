# Docker registry

Fichiers concernant la mise en place du registry docker local au SI.

Mettre en place le registry: sur le serveur docker
```shell
sudo apt update
sudo apt install wget
wget http://tiny.cc/in80101/reg-setup.sh
# Long version: https://github.com/Anatou/projet-orion-hcl/raw/refs/heads/main/docker-registry/reg-setup.sh
```

Partage des certs-certificates: sur le client docker
```shell
sudo apt update
sudo apt install wget
wget http://tiny.cc/in80101/get-certs.sh
# Long version: https://github.com/Anatou/projet-orion-hcl/raw/refs/heads/main/docker-registry/get-certs.sh
```
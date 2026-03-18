# Docker registry

Fichiers concernant la mise en place du registry docker local au SI.

Mettre en place le registry: sur le serveur docker
```shell
user=user
psswd=password
wget http://tiny.cc/in80101/reg-setup.sh
chmod +x reg-setup.sh
./reg-setup.sh
# Long version: https://github.com/Anatou/projet-orion-hcl/raw/refs/heads/main/docker-registry/reg-setup.sh
```

Partage des certs-certificates: sur le client docker
```shell
wget http://tiny.cc/in80101/get-certs.sh
chmod +x get-certs.sh
./get-certs.sh
# Long version: https://github.com/Anatou/projet-orion-hcl/raw/refs/heads/main/docker-registry/get-certs.sh
```
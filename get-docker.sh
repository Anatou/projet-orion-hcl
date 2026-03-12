#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt install -y curl

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Setup rootless (docker for user)
sudo apt install -y uidmap
dockerd-rootless-setuptool.sh install
echo "export DOCKER_HOST=unix:///run/user/1000/docker.sock" >> $HOME/.bashrc
export DOCKER_HOST=unix:///run/user/1000/docker.sock
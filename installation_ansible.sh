#! /usr/bin/env bash

sudo apt install gnupg2 apt-transport-https
sudo echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" > /etc/apt/source.list.d/ansible.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
sudo apt update
sudo apt install ansible

# Après avoir modifier la conf des serveurs SSH pour accepter une connection root avec mot de passe
ssh-keygen
ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.0.{10,11,12,13,14}

sudo cp -a hosts /etc/ansible/

ansible all -m ping

SHELL := /usr/bin/env bash

.PHONY = install

all: install init test

install:
	apt update
	apt upgrade -y
	apt full-upgrade -y
	apt install -y git openssh-server openssh-client gnupg2 apt-transport-https python2
	echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" > /etc/apt/sources.list.d/ansible.list
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
	apt update
	apt install -y ansible

init:
	cp -a hosts /etc/ansible
	ssh-keygen -t rsa
	ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.0.{10,11,12,13,14}

test:
	ansible all -m ping --one-line

dev:
	apt install -y yamllint
	cp snippets/pre-commit .git/hook/pre-commit

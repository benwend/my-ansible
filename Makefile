SHELL := /usr/bin/env bash
VENV := .venv/bin

.PHONY = install

install:
	apt update
	apt upgrade -y
	apt install -y git openssh-server openssh-client python3 python3-pip
	pip3 install -U pip
	pip3 install virtualenv

init:
	#ssh-keygen -t rsa
	#ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.0.{10,11,12,13,14}
	python3 -m virtualenv .venv
	"${VENV}"/pip install -U pip ansible

test:
	"${VENV}/"ansible -i inventory.ini all -m ping --one-line

dev:
	"${VENV}"/pip install -U ansible-lint yamllint
	cp snippets/pre-commit .git/hooks/pre-commit

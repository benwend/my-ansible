SHELL := /usr/bin/env bash
VENV := .venv-test
HOME := .

.PHONY = install init test dev

install:
	apt update && apt upgrade -y
	apt install -y git openssh-server openssh-client python3 python3-pip python3-venv
	pip3 install -U pip setuptools

init:
	python3 -m venv "${VENV}"
	"${VENV}"/bin/pip install -U pip setuptools
	"${VENV}"/bin/pip install -r "${HOME}"/requirements.txt
	mkdir -p "${HOME}"/logs

test:
	"${VENV}/bin/"ansible-playbook "${HOME}"/debugging.yml --check

dev:
	"${VENV}"/bin/pip install -r "${HOME}"/requirements-dev.txt
	cp "${HOME}"/snippets/pre-commit "${HOME}"/.git/hooks/pre-commit

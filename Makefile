SHELL := /usr/bin/env bash
VENV := .venv
HOME := .

.PHONY = venv

install:
	apt install -y git openssh-server openssh-client python3 python3-pip python3-venv
	pip3 install -U pip setuptools wheel

venv:
	python3 -m venv "${VENV}"
	"${VENV}"/bin/pip install -U pip setuptools wheel

init:
	"${VENV}"/bin/pip install -r "${HOME}"/requirements.txt
	mkdir -p "${HOME}"/logs

dev:
	"${VENV}"/bin/pip install -r "${HOME}"/requirements-dev.txt
	pre-commit install

test:
	"${VENV}/bin/"ansible-playbook "${HOME}"/debugging.yml --check

lint:
	pre-commit run --all-files

clean:
	rm -rf /
		.ansible
		.cache
		logs/*

mrproper: clean
	rm -rf /
		"${VENV}"
		logs

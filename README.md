Ansible-symfony
===============

This git project was created to install my personal development environment for my Cernunnos project and also test the automatisation of the installation of my personal computer.

Requirement
-----------

 - Debian 10
 - Pkg: Git + Python2 (for Ansible) + openssh-server + openssh-client + gnupg2

Installation
------------

Previously, initialise the host file. Then, Install Ansible from the legacy repository:

```bash
$ su -
# echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" > /etc/apt/sources.list.d/ansible.list
# apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
# apt update && apt install -y ansible
```

Or:
 - install the make package,
 - edit the __init__ target in Makefile with your username and hostnames,
 - configure the SSH server on your hosts to accept a password connection to install the SSH pubkey
 - and execute the Makefile in root privilegies: `make all`

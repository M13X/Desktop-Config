# Desktop Configurator

## Starting

Download `desktop-config.sh`

Then run the script, `sudo` privilages will be required:
```shell
bash desktop-config.sh
```

> [!NOTE]
> This script will install all the necesary components.  
> The following chapters are describing what the script is doing.

## Host setup

Script will begin by <ins>updating</ins> the package mananager and installing the following packages on host:
- python
- python3-pip
- python3-venv
- sshpass
- openssh-client

Then it will download this repository fully.

A virtual environment `.ansible-venv` will be created and activated.

Ansible will be installed inside the virtual environment and `ansible-galaxy` will install `community.general` collection

> [!WARNING]
> `inventory.ini` is currently hardcoded.  
> Future implementation might include a dynamic inventory.

The playbook will run:
```shell
ansible-playbook -i inventory.ini playbook.yml
```

## Desktop-Configurator
### CLI Setup

This step will install the following bash utilities:
- grep
- plocate
- curl
- fzf
- nano
- net-tools
- htop

And CLI applications:
- git
- git-man
- ansible
- docker.io
- kubectl
- minikube


### Dev GUI

This step will install and configure applications that might be used as GUI.

First will begin with dependencies:
- wget
- software-properties-common
- apt-transport-https
- gpg

Followed by the applications:
- firefox
- p7zip-full
- p7zip-rar
- virtualbox
- virtualbox-qt
- unzip
- Meld
- VS Code

Git will be configured to use a Diff/Merge tool.

Then a font is installed along with [Starship](https://starship.rs/) for customizable prompt.


## Clean-up

The repository will be removed from host.

## Extras

> [!NOTE]
> In this repository a GitHub Action is present `ansible-lint.yml` that will trigger when a pull request towards an important branch is created.  
> This will lint `playbook.yml` 

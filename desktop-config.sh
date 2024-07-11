#! /bin/bash

sudo apt update
sudo apt install -y python3-full git ansible openssh-client

git clone https://github.com/M13X/Desktop-Config.git
cd Desktop-Config


python3 -m venv .ansible-venv
source .ansible-venv/bin/activate

pip3 install ansible-dev-tools
ansible-galaxy collection install community.general

ansible-playbook -i inventory.ini playbook.yml

#! /bin/bash

# Define color variables
RED='\033[0;91m'
GREEN='\033[0;92m'
BLUE='\033[0;94m'
NC='\033[0m' # No Color


echo -e "${GREEN}==============================${NC}"
echo -e "${RED}     Desktop Configurator     ${NC}"
echo -e "${GREEN}==============================${NC}"
echo ""

echo -e "${BLUE}------- System Update -------${NC}"
sudo apt update
sudo apt install -y git python3 python3-venv python3-pip sshpass openssh-client
echo -e "${BLUE}------- System Updated ------${NC}"
echo ""

echo -e "${BLUE}---- Download Repository ----${NC}"
git clone https://github.com/M13X/Desktop-Config.git
cd Desktop-Config
echo -e "${BLUE}--- Downloaded Repository ---${NC}"
echo ""

echo -e "${BLUE}---- Activate Environment ---${NC}"
python3 -m venv .ansible-venv
source .ansible-venv/bin/activate
echo -e "${BLUE}--- Activated Environment ---${NC}"
echo ""

echo -e "${BLUE}------ Install Ansible ------${NC}"
pip3 install ansible
ansible-galaxy collection install community.general
echo -e "${BLUE}----- Installed Ansible -----${NC}"
echo ""

echo -e "${BLUE}-------- Run Playbook -------${NC}"
ansible-playbook -i inventory.ini playbook.yml
echo -e "${BLUE}----- Finished Playbook -----${NC}"
echo ""

echo -e "${BLUE}---------- Clean-up ---------${NC}"
cd ..
rm -rf Desktop-Config/
echo "Removed Repository"
echo -e "${BLUE}--------- Cleaned-up --------${NC}"

echo ""
echo -e "${GREEN}==============================${NC}"
echo -e "${RED}     Desktop Configurated     ${NC}"
echo -e "${GREEN}==============================${NC}"
echo ""

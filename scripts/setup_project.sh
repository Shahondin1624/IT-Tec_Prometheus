#!/bin/bash

#This script will download the IT-Tec_Prometheus Repository, install docker and configure the firewall to let the required applications through

#Prerequisites
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && 
sudo apt install ca-certificates -y &&
sudo apt install curl -y  &&
sudo apt install gnupg -y &&
#Cloning the repository
git clone https://github.com/Shahondin1624/IT-Tec_Prometheus &&
chmod +x ./IT-Tec_Prometheus/scripts/configure_project.sh &&
#configuring the docker repository in apt
sudo install -m 0755 -d /etc/apt/keyrings -y &&
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg &&
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null &&
  sudo apt update &&
#installing docker
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y &&
sudo systemctl docker start &&  
sudo docker pull prom/prometheus &&
#configuring the firewall
sudo apt install ufw -y &&
sudo ufw allow 22/tcp &&
sudo ufw allow 30090/tcp && 
sudo ufw allow 9000/tcp &&
sudo ufw allow 9090/tcp &&
sudo ufw enable

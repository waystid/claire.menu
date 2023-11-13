#!/bin/bash

######################################################################
# Title   : Install Docker
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Set hostname variable
name=$(hostname)

install_docker () {
  sudo apt-get remove docker docker-engine docker.io containerd runc
  sudo apt-get update
  sudo apt-get install ca-certificates curl gnupg lsb-release
  sudo rm /usr/share/keyrings/docker-archive-keyring.gpg
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io -y
  sudo groupadd docker
  sudo usermod -aG docker $USER 
}

create_docker_network () {
  sed -i "s/^dockernet=.*$/dockernet=$name/" /opt/claire/claire.menu/.profile

  docker network create $name > /dev/null 2>&1
}

install_docker
create_docker_network

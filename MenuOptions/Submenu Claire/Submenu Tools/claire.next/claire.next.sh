#!/bin/bash
######################################################################
# Title   : claire.next
# By      : Lu Cipher
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by CLAIRE.IO™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# Set hostname variable
name=$(hostname)
dockernet=$(hostname)

logo
msgbox "claire.next"

# App Info
app="boxdrop"           # App Name
title="Nextcloud"        # Readable App Title
image="nextcloud:apache" # Image and Tag

# App
local_appcreate () {
  msgbox "Installing $title..."

  ###Create mount folders###
  #Mount temp directory
  mkdir claire.temp
  mount -t nfs 192.168.1.18:/mnt/nimbus/dedup/nc claire.temp
  mkdir claire.temp/$name
  
  #Create app folder for database
  mkdir -p /config/$app
  rsync -av --progress "claire.temp/default/db/" "/config/$app/db/"
  umount claire.temp
  rmdir claire.temp

  #Create initial docker container
  cd /config/$app
  tee <<-EOF > .env
APP_NAME=$app
IMAGE=$image
TP_APP=$tp_app
EOF
  tee <<-EOF > compose.yaml
services:
  nc:
    image: \${IMAGE:?err}
    environment:
      - POSTGRES_HOST=db
      - POSTGRES_PASSWORD=hzDf1b4sJ4OUqyTN
      - POSTGRES_DB=$app
      - POSTGRES_USER=waystid
    container_name: \${APP_NAME:?err}
    network_mode: host
    networks:
      $dockernet:
        driver: bridge
        external: true
    ports:
      - 8095:80
    env_file:
      - /config/.id.env
      - /config/.timezone.env
    volumes:
      - ~/data:/var/www/html
    restart: unless-stopped
    security_opt:
      - apparmor:unconfined
  db:
    image: postgres:alpine
    environment:
      - POSTGRES_PASSWORD=hzDf1b4sJ4OUqyTN
      - POSTGRES_DB=$app
      - POSTGRES_USER=waystid
    networks:
      $dockernet:
      driver: bridge
      external: true
    restart: always
    volumes:
      - /config/$app/db:/var/lib/postgresql/data
    expose:
      - 5432
EOF
  docker compose up -d --force-recreate
}

# List Links
local_appfinalization () {
  logo
  msgbox "All Done! Here is the link to $title:"
  echo
  ip=$(hostname -I | awk '{print $1}')
  echo "$title: http://$ip:8095"
  echo
}

# List Links
move_data_folder () {
  logo
  msgbox "Moving data folder..."
  echo
  while true; do
    echo "You should wait until nextcloud has launched before proceeding."
    echo "$title: http://$ip:8095"
    echo
    read -p "Type 'confirm' to proceed: " confirmation
    if [ "$confirmation" = "confirm" ]; then
        break
    else
        echo "Confirmation failed. Please try again."
    fi
  done

  docker stop $(docker ps -a | grep '$app' | awk '{print $1}')
  docker rm $(docker ps -a | grep '$app' | awk '{print $1}')

  mkdir claire.temp
  mount -t nfs 192.168.1.18:/mnt/nimbus/dedup/nc claire.temp

  rsync -av --progress "~/data/" "claire.temp/$name/data/"

  mkdir /$app
  echo "192.168.1.18:/mnt/nimbus/dedup/nc/$name /$app nfs4 defaults 0 0" | tee -a /etc/fstab
  mount /$app

  rm -r ~/data
  umount claire.temp
  rmdir claire.temp

}

# App
local_appcreate_final () {
  msgbox "Installing $title..."

  #Create finished docker container
  cd /config/$app
  tee <<-EOF > .env
APP_NAME=$app
IMAGE=$image
TP_APP=$tp_app
EOF
  tee <<-EOF > compose.yaml
services:
  nc:
    image: \${IMAGE:?err}
    environment:
      - POSTGRES_HOST=db
      - POSTGRES_PASSWORD=hzDf1b4sJ4OUqyTN
      - POSTGRES_DB=$app
      - POSTGRES_USER=waystid
    container_name: \${APP_NAME:?err}
    network_mode: host
    networks:
      $dockernet:
        driver: bridge
        external: true
    ports:
      - 8095:80
    env_file:
      - /config/.id.env
      - /config/.timezone.env
    volumes:
      - /$app/data:/var/www/html
    restart: unless-stopped
    security_opt:
      - apparmor:unconfined
  db:
    image: postgres:alpine
    environment:
      - POSTGRES_PASSWORD=hzDf1b4sJ4OUqyTN
      - POSTGRES_DB=$app
      - POSTGRES_USER=waystid
    restart: always
    networks:
      $dockernet:
      driver: bridge
      external: true
    volumes:
      - /config/$app/db:/var/lib/postgresql/data
    expose:
      - 5432
EOF
  docker compose up -d --force-recreate
}

# Execute

local_appcreate
move_data_folder 
local_appcreate_final
local_appfinalization
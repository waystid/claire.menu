#!/bin/bash
######################################################################
# Title   : Install Nginx Proxy Manager
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# App Info
app="npm"                               # App Name
title="Nginx Proxy Manager"             # Readable App Title
image="jc21/nginx-proxy-manager:latest" # Image and Tag

# App
local_appcreate () {
  msgbox "Installing $title..."
  mkdir -p /config/$app && cd /config/$app
  tee <<-EOF > .env
APP_NAME=$app
IMAGE=$image
EOF
  tee <<-EOF > compose.yaml
services:
  service-name:
    image: \${IMAGE:?err}
    container_name: \${APP_NAME:?err}
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    networks:
      - $dockernet
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
    restart: unless-stopped
    security_opt:
      - apparmor:unconfined

networks:
  $dockernet:
    driver: bridge
    external: true
EOF
  docker compose up -d --force-recreate
}

# List Links
local_appfinalization () {
  logo
  msgbox "All Done! Here is the link to $title:"
  echo
  ip=$(hostname -I | awk '{print $1}')
  echo "$title: http://$ip:81"
  echo
  echo "Default Admin User"
  echo "Email   : admin@example.com"
  echo "Password: changeme"
  echo
}

# E  # Local Docker
  if [ "$app" != "registry" ]; then
    #Update image file
    update_image_file="/data/media/resources/claire/update_images"
    
    # Check if the line is already in the file
    if ! grep -qF "$image" "$update_image_file"; then
      sudo chmod u+w $update_image_file
      echo "${image} | ${app}:${image_tag}" >> $update_image_file
    else
      echo "Line already exists in $update_image_file"
    fi
    # Execute local.docker function here
    local.docker
  else
    echo "Skipping local.docker function because app is set to 'registry'"
  fixecute

local_appcreate
local_appfinalization
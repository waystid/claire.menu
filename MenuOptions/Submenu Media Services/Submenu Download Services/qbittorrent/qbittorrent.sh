#!/bin/bash
######################################################################
# Title   : Install Qbittorrent
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# App Info
app="qbittorrent"                                  # App Name
title="qbittorrent"                                # Readable App Title
image="cr.hotio.dev/hotio/qbittorrent"             # Image and Tag
tp_app="qbittorrent"                               # Theme Park App Name
porte="8080"                                       # External Port
porti="8080"                                       # Internal Port

# App
local_appcreate () {
  msgbox "Installing $title..."
  mkdir -p /config/$app && cd /config/$app
  tee <<-EOF > .env
APP_NAME=$app
IMAGE=$image
TP_APP=$tp_app
PORTE=$porte
PORTI=$porti

EOF
  tee <<-EOF > compose.yaml
services:
  service-name:
    image: \${IMAGE:?err}
    container_name: \${APP_NAME:?err}
    network_mode: host
    env_file:
      - /config/.id.env
      - /config/.timezone.env
      - /config/.themepark.env
    volumes:
      - /config/\${APP_NAME:?err}:/config
      - /data/torrents:/data/torrents
    ports:
      - \${PORTE:?err}:${PORTI:?err}      
    restart: unless-stopped
    security_opt:
      - apparmor:unconfined
EOF
  docker compose up -d --force-recreate
}

# List Links
local_appfinalization () {
  porte="8080"
  check_ibradashy
  logo
  msgbox "All Done! Here is the link to $title:"
  echo
  ip=$(hostname -I | awk '{print $1}')
  echo "$title: http://$ip:8080"
  ibradashy
  msgbox "You can also find $title on your IBRACORP Dashy website:"
  echo "http://$ip:8086"
  echo
}

# Execute

# Local Docker
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
  fi

local_appcreate
local_appfinalization
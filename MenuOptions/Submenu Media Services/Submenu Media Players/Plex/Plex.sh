#!/bin/bash
######################################################################
# Title   : Install Plex
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# App Info
app="plex"                              # App Name
title="Plex"                            # Readable App Title
image="lscr.io/linuxserver/plex:latest" # Image and Tag
tp_app="plex"                           # Theme Park App Name


# App
local_appcreate () {
  msgbox "Installing $title..."
  mkdir -p /config/$app && cd /config/$app
  tee <<-EOF > .env
APP_NAME=$app
IMAGE=$image
TP_APP=$tp_app
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
    environment:
      - VERSION=docker
      - PLEX_PASS="yes"
      - PLEX_CLAIM= #optional
      - ADVERTISE_IP
      - ALLOWED_NETWORKS
    volumes:
      - /config/plex/config:/config
      - /config/plex/transcode:/transcode
      - /data/media:/media
    restart: unless-stopped
    security_opt:
      - apparmor:unconfined
EOF
  docker compose up -d --force-recreate
}

# List Links
local_appfinalization () {
  porte="32400/web"
  check_ibradashy
  logo
  msgbox "All Done! Here is the link to $title:"
  echo
  ip=$(hostname -I | awk '{print $1}')
  echo "$title: http://$ip:32400/web"
  ibradashy
  msgbox "You can also find $title on your IBRACORP Dashy website:"
  echo "http://$ip:8086"
  echo
}

# Execute

local_appcreate
local_appfinalization

#!/bin/bash

######################################################################
# Title   : Cloudflare Tunnel Installer
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# Greetings
greetings () {
  logo
  msgbox "Cloudflare Tunnel Installer"
}

# Parameters
parameters () {
  msgbox "Setting Parameters for Your Setup"
  tee <<-EOF
We will now automatically install your Cloudflare Tunnel.

Please enter all parameters without any "".

EOF
  read -p "Your Domain (domain.com)            : " domain
  read -p "The IP address of your Reverse Proxy: " ip
  read -p "The port of your Reverse Proxy      : " port
  read -p "The tunnel name (lower caps)        : " tunnel
  echo
  }

# Preparations
preparations () {
  mkdir -p /config/cloudflared
  chmod -R 777 /config/cloudflared
  cd /config/cloudflared
}

# Tunnel Creation
tunnelcreation () {
  msgbox "Tunnel Authentication"

  tee <<-EOF > compose.yaml
name: $tunnelname
services:
  cloudflared:
    image: cloudflare/cloudflared
    container_name: $app_$tunnelname
    restart: always
    volumes:
      - /config/cloudflared/$tunnelname:/home/nonroot/.cloudflared/
    security_opt:
      - apparmor:unconfined
    command: tunnel  --no-autoupdate run --token $token
EOF
  docker compose up -d --force-recreate
}

create.tunnel(){

}

# Execute
greetings
#parameters
preparations
#tunnelcreation

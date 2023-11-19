#!/bin/bash
######################################################################
# Title   : Install Komf
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# Collect komga login email and password

read -p "Your login email            : " email
read -p "Please enter komga password     : " passwd


# App Info
app="Komf"                                  # App Name
title="Komf"                                # Readable App Title
image="sndxr/komf:latest"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config" # Volumes
tp_app="Komf"                               # Theme Park App Name
porte="8089"                                    # External Port
porti="8085"                                    # Internal Port
extrapayload="    environment: # optional env config
      - KOMF_KOMGA_BASE_URI=http://komga:8085
      - KOMF_KOMGA_USER=\$email
      - KOMF_KOMGA_PASSWORD=\$passwd
      - KOMF_LOG_LEVEL=INFO
      - KOMF_SERVER_PORT=8089"                                 # Extra Payload to add to the Compose


# Execute
app
mkdir -p /config/$app && cd /config/$app
echo "KOMF_KOMGA_USER=$email" >> /config/$app/.env
echo "KOMF_KOMGA_PASSWORD=$passwd" >> /config/$app/.env
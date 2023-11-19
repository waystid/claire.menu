#!/bin/bash
######################################################################
# Title   : Install Vaultwarden
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*
admintoken=$(openssl rand -base64 48)

# App Info
app="vaultwarden"                 # App Name
title="Vaultwarden"               # Readable App Title
image="vaultwarden/server:latest" # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/data" # Volumes
tp_app=""                               # Theme Park App Name
porte="4743"                                    # External Port
porti="80"                                    # Internal Port
extrapayload="    environment:
      - WEBSOCKET_ENABLED=true  # Enable WebSocket notifications.
      - ADMIN_TOKEN=$admintoken
    "                                 # Extra Payload to add to the Compose add 4 spance to the top group for example environment: and 6 for the childs (if copy and pasting you just need to add the space to the parent).


# Execute
app


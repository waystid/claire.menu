#!/bin/bash
######################################################################
# Title   : Install Komga
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# App Info
app="Plex-Meta-Manager"              # App Name
title="Plex-Meta-Manager"            # Readable App Title
image="meisnate12/plex-meta-manager" # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config" # Volumes
tp_app="Plex"                                   # Theme Park App Name
# porte="8085"                                    # External Port
# porti="8080"                                    # Internal Port
extrapayload="" # Extra Payload to add to the Compose

# Execute
app

sudo mkdir -p /config/Plex-Meta-Manager/assets
curl -fLvo /config/Plex-Meta-Manager/config.yml https://raw.githubusercontent.com/meisnate12/Plex-Meta-Manager/master/config/config.yml.template

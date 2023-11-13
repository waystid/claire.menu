#!/bin/bash
######################################################################
# Title   : Install Prowlarr
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# App Info
app="prowlarr"                                   # App Name
title="Prowlarr"                                 # Readable App Title
image="lscr.io/linuxserver/prowlarr:develop"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config" # Volumes
tp_app="prowlarr"                                 # Theme Park App Name
porte="9696"                                    # External Port
porti="9696"                                    # Internal Port
extrapayload=""                                 # Extra Payload to add to the Compose

# Execute
app
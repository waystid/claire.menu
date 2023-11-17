#!/bin/bash
######################################################################
# Title   : Install Sonarr 4K
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# App Info
app="sonarr4k"                                 # App Name
title="Sonarr 4K"                              # Readable App Title
image="lscr.io/linuxserver/sonarr:develop"      # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config
      - /data:/data"                     # Volumes
tp_app="sonarr"                                # Theme Park App Name
porte="8990"                                   # External Port
porti="8989"                                   # Internal Port
extrapayload="    environment:
      - TP_ADDON=sonarr-4k-logo"               # Extra Payload to add to the Compose

# Execute
app
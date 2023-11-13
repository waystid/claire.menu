#!/bin/bash
######################################################################
# Title   : Install Radarr 4K
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# App Info
app="radarr4k"                                 # App Name
title="Radarr 4K"                              # Readable App Title
image="lscr.io/linuxserver/radarr:latest"      # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config
      - /data:/media"                     # Volumes
tp_app="radarr"                                # Theme Park App Name
porte="7879"                                   # External Port
porti="7878"                                   # Internal Port
extrapayload="    environment:
      - TP_ADDON=radarr-4k-logo"               # Extra Payload to add to the Compose

# Execute
app
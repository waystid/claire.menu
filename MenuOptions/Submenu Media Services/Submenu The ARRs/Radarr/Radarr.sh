#!/bin/bash
######################################################################
# Title   : Install Radarr
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# App Info
app="radarr"                                   # App Name
title="Radarr"                                 # Readable App Title
image="lscr.io/linuxserver/radarr:latest"      # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config
      - /data:/media"                     # Volumes
tp_app="radarr"                                # Theme Park App Name
porte="7878"                                   # External Port
porti="7878"                                   # Internal Port
extrapayload=""                                # Extra Payload to add to the Compose

# Execute
app
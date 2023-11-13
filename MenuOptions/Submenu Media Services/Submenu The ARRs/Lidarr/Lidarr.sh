#!/bin/bash
######################################################################
# Title   : Install Lidarr
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# App Info
app="lidarr"                                   # App Name
title="Lidarr"                                 # Readable App Title
image="lscr.io/linuxserver/lidarr:latest"      # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config
      - /data:/media"                     # Volumes
tp_app="lidarr"                                # Theme Park App Name
porte="8686"                                   # External Port
porti="8686"                                   # Internal Port
extrapayload=""                                # Extra Payload to add to the Compose

# Execute
app
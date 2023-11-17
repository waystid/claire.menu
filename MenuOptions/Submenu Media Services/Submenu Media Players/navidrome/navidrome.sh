#!/bin/bash
######################################################################
# Title   : Install Navidrome
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# App Info
app="navidrome"                                  # App Name
title="navidrome"                                # Readable App Title
image="deluan/navidrome:latest"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/data
      - /data/media/music/waystid:/music:ro"                     # Volumes
tp_app="plex"                                # Theme Park App Name
porte="4533"                                   # External Port
porti="4533"                                   # Internal Port
extrapayload="    environment:
      - ND_SCANSCHEDULE=1h
      - ND_LOGLEVEL=info  
      - ND_SESSIONTIMEOUT=24h
      # - ND_BASEURL=""
    "                                # Extra Payload to add to the Compose

# Execute
app
#!/bin/bash
######################################################################
# Title   : Install NZBGet
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# App Info
app="nzbget"                                  # App Name
title="NZBGet"                                # Readable App Title
image="lscr.io/linuxserver/nzbget:latest"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config
      - /data/usenet:/media"                     # Volumes
tp_app="nzbget"                                # Theme Park App Name
porte="6789"                                   # External Port
porti="6789"                                   # Internal Port
extrapayload="    environment:
          - PUID=1000
          - PGID=1000
          - TZ=America/New_York
          - NZBGET_USER=nzbget #optional
          - NZBGET_PASS=Br00klin #optional
    "                                # Extra Payload to add to the Compose

# Execute
app
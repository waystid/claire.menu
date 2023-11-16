#!/bin/bash
######################################################################
# Title   : Install Qbittorrent
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# App Info
app="qbittorrent"                                  # App Name
title="qbittorrent"                                # Readable App Title
image="cr.hotio.dev/hotio/qbittorrent"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config
      - /data/torrents:/media"                     # Volumes
tp_app="qbittorrent"                                # Theme Park App Name
porte="8080"                                   # External Port
porti="8080"                                   # Internal Port
extrapayload=""                                # Extra Payload to add to the Compose

# Execute
app
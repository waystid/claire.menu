#!/bin/bash
######################################################################
# Title   : Install SABnzbd
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# App Info
app="sabnzbd"                                  # App Name
title="SABnzbd"                                # Readable App Title
image="lscr.io/linuxserver/sabnzbd:latest"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config
      - /data/usenet:/media"                     # Volumes
tp_app="sabnzbd"                                # Theme Park App Name
porte="8081"                                   # External Port
porti="8080"                                   # Internal Port
extrapayload=""                                # Extra Payload to add to the Compose

# Execute
app
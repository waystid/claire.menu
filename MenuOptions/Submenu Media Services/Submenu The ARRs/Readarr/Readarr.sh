#!/bin/bash
######################################################################
# Title   : Install Readarr
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# App Info
app="readarr"                                   # App Name
title="Readarr"                                 # Readable App Title
image="lscr.io/linuxserver/readarr:develop"      # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config
      - /data:/media"                     # Volumes
tp_app="readarr"                                # Theme Park App Name
porte="8787"                                   # External Port
porti="8787"                                   # Internal Port
extrapayload=""                                # Extra Payload to add to the Compose

# Execute
app

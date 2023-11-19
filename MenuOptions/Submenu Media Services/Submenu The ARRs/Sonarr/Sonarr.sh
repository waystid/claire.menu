#!/bin/bash
######################################################################
# Title   : Install Sonarr
# By      : DiscDuck
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# App Info
app="sonarr"                                   # App Name
title="Sonarr"                                 # Readable App Title
image="lscr.io/linuxserver/sonarr:develop"      # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config
      - /data:/data"                     # Volumes
tp_app="sonarr"                                # Theme Park App Name
porte="8989"                                   # External Port
porti="8989"                                   # Internal Port
extrapayload=""                                # Extra Payload to add to the Compose

# Execute
app
#!/bin/bash
######################################################################
# Title   : Install Dizque TV
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# App Info
app="dizquetv"                                  # App Name
title="Dizque TV"                                # Readable App Title
image="vexorian/dizquetv:latest-nvidia"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config" # Volumes
tp_app="plex"                               # Theme Park App Name
porte="8000"                                    # External Port
porti="8000"                                    # Internal Port
extrapayload=""                                 # Extra Payload to add to the Compose

# Execute
app
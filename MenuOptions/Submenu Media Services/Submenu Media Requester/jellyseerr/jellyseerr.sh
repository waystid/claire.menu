#!/bin/bash
######################################################################
# Title   : Install Jellyseer
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# App Info
app="jellyseerr"                                 # App Name
title="jellyseerr"                               # Readable App Title
image="fallenbagel/jellyseerr:latest"    # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/app/config" # Volumes
porte="5056"                                    # External Port
porti="5055"                                    # Internal Port
extrapayload="    environment:
      - JELLYFIN_TYPE=emby"     #comment if using jellyfin                            # Extra Payload to add to the Compose

# Execute
app
#!/bin/bash
######################################################################
# Title   : Install Komga
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# App Info
app="Komga"                                  # App Name
title="Komga"                                # Readable App Title
image="gotson/komga"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config" # Volumes
tp_app="Komga"                               # Theme Park App Name
porte="8085"                                    # External Port
porti="8080"                                    # Internal Port
extrapayload=""                                 # Extra Payload to add to the Compose


# Execute
app
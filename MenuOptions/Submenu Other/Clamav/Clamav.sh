#!/bin/bash
######################################################################
# Title   : Install Komga
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# App Info
app="Clamav"                                  # App Name
title="Clamav"                                # Readable App Title
image="clamav/clamav"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config" # Volumes
tp_app="Clamav"                               # Theme Park App Name
porte="3310"                                    # External Port
porti="3310"                                    # Internal Port
extrapayload=""                                 # Extra Payload to add to the Compose


# Execute
app
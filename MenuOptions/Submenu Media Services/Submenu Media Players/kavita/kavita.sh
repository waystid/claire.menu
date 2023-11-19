#!/bin/bash
######################################################################
# Title   : Install Kavita
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# App Info
app="kavita"                                  # App Name
title="Kavita"                                # Readable App Title
image="kizaing/kavita:latest"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/kavita/config
      - /data/media/books:/books"                     # Volumes
tp_app="overseerr"                                # Theme Park App Name
porte="5000"                                   # External Port
porti="5000"                                   # Internal Port
# extrapayload=""                                # Extra Payload to add to the Compose this one are for hw trasncode

# Execute
app
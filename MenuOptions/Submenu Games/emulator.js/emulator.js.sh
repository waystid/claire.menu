#!/bin/bash
######################################################################
# Title   : Install Emby
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# App Info
app="emulator"                                  # App Name
title="emulator"                                # Readable App Title
image="lscr.io/linuxserver/emulatorjs:latest"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config
      - /data/games:/data"                     # Volumes
tp_app="emby"                                # Theme Park App Name
porte="3000"                                   # External Port
porti="3000"                                   # Internal Port
# extrapayload="    devices:
#       - /dev/dri:/dev/dri #optional
#       - /dev/vchiq:/dev/vchiq #optional
#       - /dev/video10:/dev/video10 #optional
#       - /dev/video11:/dev/video11 #optional
#       - /dev/video12:/dev/video12 #optional"                                # Extra Payload to add to the Compose this one are for hw trasncode

# Execute
app

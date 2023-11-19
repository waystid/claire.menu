#!/bin/bash
######################################################################
# Title   : Install JDownloader2
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# App Info
app="jdownloader-2"                     # App Name
title="JDownloader2"                   # Readable App Title
image="jlesage/jdownloader-2:latest"        # Image and Tag
volumes="    volumes:
      - /config/jdownloader-2:/config:rw
      - /data/downloads:/output:rw" # Volumes
porte="5800"                          # External Port
porti="5800"                          # Internal Port
extrapayload=""                       # Extra Payload to add to the Compose

# Execute
app
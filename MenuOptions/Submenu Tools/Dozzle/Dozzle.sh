#!/bin/bash
######################################################################
# Title   : Install Dozzle
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# App Info
app="dozzle"                                       # App Name
title="Dozzle"                                     # Readable App Title
image="amir20/dozzle:latest"                       # Image and Tag
volumes="    volumes:
      - /var/run/docker.sock:/var/run/docker.sock" # Volumes
porte="9999"                                       # External Port
porti="8080"                                       # Internal Port
extrapayload=""                                    # Extra Payload to add to the Compose

# Execute
app
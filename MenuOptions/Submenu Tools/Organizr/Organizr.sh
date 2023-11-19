#!/bin/bash
######################################################################
# Title   : Install Organizr
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# App Info
app="organizr"                                          # App Name
title="Organizr"                                        # Readable App Title
image="ghcr.io/organizr/organizr:latest"                  # Image and Tag
volumes="    volumes:
      - /config/organizr:/config" # Volumes
porte="8082"                                          # External Port
porti="80"                                          # Internal Port
extrapayload=""                                       # Extra Payload to add to the Compose

# Execute
app
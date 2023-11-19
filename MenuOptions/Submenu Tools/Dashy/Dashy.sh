#!/bin/bash
######################################################################
# Title   : Install Dashy
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# App Info
app="dashy"                              # App Name
title="Dashy"                            # Readable App Title
image="lissy93/dashy:latest"             # Image and Tag
volumes="    volumes:
      - ./conf.yml:/app/public/conf.yml" # Volumes
porte="8087"                             # External Port
porti="80"                               # Internal Port
extrapayload=""                          # Extra Payload to add to the Compose

# Execute
mkdir -p /config/dashy
touch /config/dashy/conf.yml
app
#!/bin/bash
######################################################################
# Title   : Install Dockerproxy
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################
# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# App Info
app="Dockerproxy"                                  # App Name
title="Dockerproxy"                                # Readable App Title
image="ghcr.io/tecnativa/docker-socket-proxy:latest"     # Image and Tag
volumes="    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro" # Volumes
tp_app=""                               # Theme Park App Name
porte="2375"                                    # External Port
porti="2375"                                    # Internal Port
extrapayload="    environment:
      CONTAINERS: 1
      POST: 0

    "                                 # Extra Payload to add to the Compose add 4 spance to the top group for example environment: and 6 for the childs (if copy and pasting you just need to add the space to the parent).

# Execute
app

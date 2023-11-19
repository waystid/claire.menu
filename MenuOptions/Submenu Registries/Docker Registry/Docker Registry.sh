#!/bin/bash
######################################################################
# Title   : Install Docker Registry
# By      : Lu Cipher, CE)
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# App Info
app="registry"                                  # App Name
title="Docker Registry"                         # Readable App Title
image="registry:latest"                         # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/var/lib/registry"
tp_app=""                                       # Theme Park App Name
porte="5000"                                    # External Port
porti="5000"                                    # Internal Port
extrapayload=""                                 # Extra Payload to add to the Compose

# Execute
app
echo '{"insecure-registries":["192.168.1.10:5000"]}' >> /etc/docker/daemon.json
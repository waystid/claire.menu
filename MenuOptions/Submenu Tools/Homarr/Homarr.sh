#!/bin/bash
######################################################################
# Title   : Install Homarr
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# App Info
app="homarr"                                          # App Name
title="Homarr"                                        # Readable App Title
image="ghcr.io/ajnart/homarr:latest"                  # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/app/data/configs
      - /var/run/docker.sock:/var/run/docker.sock:ro" # Volumes
porte="7575"                                          # External Port
porti="7575"                                          # Internal Port
extrapayload=""                                       # Extra Payload to add to the Compose

# Execute
app
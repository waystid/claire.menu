#!/bin/bash
######################################################################
# Title   : Install Ombi
# By      : DiscDuck
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# App Info
app="ombi"                                      # App Name
title="Ombi"                                    # Readable App Title
image="lscr.io/linuxserver/ombi:latest"         # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config" # Volumes
porte="3579"                                    # External Port
porti="3579"                                    # Internal Port
extrapayload=""                                 # Extra Payload to add to the Compose

# Execute
app
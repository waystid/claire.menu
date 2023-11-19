#!/bin/bash
######################################################################
# Title   : Install Notifiarr
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# App Info
app="notifiarr"                                  # App Name
title="Notifiarr"                                # Readable App Title
image="golift/notifiarr:latest"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config
      - /var/run/utmp:/var/run/utmp
      - /etc/machine-id:/etc/machine-id
    "        # Volumes
tp_app="notifiarr"                               # Theme Park App Name
porte="5454"                                    # External Port
porti="5454"                                    # Internal Port
extrapayload="    environment:
      - DN_API_KEY=21fbb16e-d220-4cd1-9381-5a607a427d7f
    "                                 # Extra Payload to add to the Compose

# Execute
app
#!/bin/bash
######################################################################
# Title   : Install Whisparr
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# App Info
app="whisparr"                                # App Name
title="Whisparr"                               # Readable App Title
image="cr.hotio.dev/hotio/whisparr:nightly"    # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config
      - /data:/media"                     # Volumes
tp_app=""                                      # Theme Park App Name
porte="6969"                                   # External Port
porti="6969"                                   # Internal Port
extrapayload=""                                # Extra Payload to add to the Compose

# Execute
app
#!/bin/bash
######################################################################
# Title   : Install Photoprism
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# App Info
app="photoprism"                               # App Name
title="Photoprism"                             # Readable App Title
image="photoprism/photoprism:latest"  # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/photoprism/storage
      - /resources/ref/photos:/photoprism/originals
      "
      -                              # Volumes
tp_app=""                                       # Theme Park App Name
porte="2342"                                    # External Port
porti="2342"                                    # Internal Port
extrapayload="    environment:
            - PHOTOPRISM_UPLOAD_NSFW=true
            - PHOTOPRISM_ADMIN_PASSWORD=insecure"                                 # Extra Payload to add to the Compose

# Execute
app

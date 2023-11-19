#!/bin/bash
######################################################################
# Title   : Install Linkstack
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# App Info
app="linkstack"                                  # App Name
title="Linkstack"                                # Readable App Title
image="linkstackorg/linkstack:latest"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/data
      - /data/media/music/waystid:/music:ro"                     # Volumes
tp_app="plex"                                # Theme Park App Name
porte="8070"                                   # External Port
porti="80"
porte2="445"
porti2="443"                                   # Internal Port
extrapayload="    environment:
            - HTTP_SERVER_NAME=lncn.bio
            - HTTPS_SERVER_NAME=lncn.bio
            - SERVER_ADMIN=president@waystid.com
            - PHP_MEMORY_LIMIT=512M
            - UPLOAD_MAX_FILESIZE=8M
    "                                # Extra Payload to add to the Compose

# Execute
app
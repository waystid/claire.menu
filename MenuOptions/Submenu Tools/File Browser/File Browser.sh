#!/bin/bash
######################################################################
# Title   : Install File Browser
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
# source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# App Info
app="file-browser"                               # App Name
title="File Broswer"                             # Readable App Title
image="filebrowser/filebrowser:latest"  # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}/filebrowser.db:/database.db
      - /mnt/:/srv"
                                   # Volumes
tp_app=""                                       # Theme Park App Name
porte="8443"                                    # External Port
porti="8443"                                    # Internal Port
extrapayload="    environment:
      - PUID=0
      - PGID=0"                                 # Extra Payload to add to the Compose

# Execute
filebrowser
app

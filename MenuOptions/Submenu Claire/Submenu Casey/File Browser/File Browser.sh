#!/bin/bash
######################################################################
# Title   : Install File Browser
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# App Info
app="file-browser"                               # App Name
title="File Browser"                             # Readable App Title
image="filebrowser/filebrowser:latest"  # Image and Tag
volumes="    volumes:
      - /mnt/:/srv"
                                   # Volumes
tp_app=""                                       # Theme Park App Name
porte="8081"                                    # External Port
porti="80"                                    # Internal Port
extrapayload=""                                 # Extra Payload to add to the Compose

# Execute

app
echo The default username and password is admin:admin
echo Be sure to change this immediately! http://192.168.1.15:8081/settings/profile

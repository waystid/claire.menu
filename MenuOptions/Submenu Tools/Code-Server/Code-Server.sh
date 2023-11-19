#!/bin/bash
######################################################################
# Title   : Install Code-Server
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# App Info
app="code-server"                               # App Name
title="Code Server"                             # Readable App Title
image="lscr.io/linuxserver/code-server:latest"  # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config
      - /config/\${APP_NAME:?err}/code:/code
      - /opt:/opt" 
      - /resources/code:/config/workspace
      -                              # Volumes
tp_app=""                                       # Theme Park App Name
porte="8443"                                    # External Port
porti="8443"                                    # Internal Port
extrapayload="    environment:
      - PUID=0
      - PGID=0"                                 # Extra Payload to add to the Compose

# Execute
app

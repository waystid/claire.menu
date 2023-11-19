#!/bin/bash
######################################################################
# Title   : Install Komga
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# App Info
app="FreshRSS"                              # App Name
title="FreshRSS"                            # Readable App Title
image="lscr.io/linuxserver/freshrss:latest" # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config" # Volumes
tp_app="Plex"                                   # Theme Park App Name
porte="8040"                                    # External Port
porti="80"                                      # Internal Port
extrapayload=""                                 # Extra Payload to add to the Compose

# Execute
app

#!/bin/bash
######################################################################
# Title   : Install theme.park registry
# By      : Lu Cipher, CE)
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# App Info
app="themepark"                                  # App Name
title="theme.park registry"                         # Readable App Title
image="ghcr.io/themepark-dev/theme.park"                         # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config"
tp_app=""                                       # Theme Park App Name
porte="8089"                                    # External Port
porti="80"                                    # Internal Port
porte2="4443"                                    # External Port
porti2="443"                                    # Internal Port
extrapayload="    environment:
      - TP_URLBASE=themepark #optional          
"                                 # Extra Payload to add to the Compose

# Execute
app
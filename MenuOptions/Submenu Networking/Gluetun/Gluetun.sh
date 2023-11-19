#!/bin/bash
######################################################################
# Title   : Install Gluetun
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################
# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# App Info
app="gluetun"                                  # App Name
title="Gluetun"                                # Readable App Title
image="qmcgaw/gluetun:latest"     # Image and Tag
volumes="    volumes:
      - /config/gluetun:/gluetun" # Volumes
extrapayload="    cap_add:
      - NET_ADMIN
    environment:
      - VPN_SERVICE_PROVIDER=private internet access
      - SERVER_REGIONS=CA Montreal
      - OPENVPN_USER=p7107613
      - OPENVPN_PASSWORD=84juRXXLy5
    "                                 # Extra Payload to add to the Compose add 4 spance to the top group for example environment: and 6 for the childs (if copy and pasting you just need to add the space to the parent).

# Execute
app

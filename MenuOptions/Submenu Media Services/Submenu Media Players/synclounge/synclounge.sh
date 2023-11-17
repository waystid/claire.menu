#!/bin/bash
######################################################################
# Title   : Install Sync Lounge
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# App Info
app="synclounge"                                       # App Name
title="Sync Lounge"                                     # Readable App Title
image="lscr.io/linuxserver/synclounge"                       # Image and Tag
porte="8088"                                       # External Port
porti="8088"                                       # Internal Port
extrapayload=""                                    # Extra Payload to add to the Compose

# Execute
app
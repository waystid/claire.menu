#!/bin/bash
######################################################################
# Title   : Install Minecraft Direwolf20 1.19
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

logo

if [ -f "/config/minecraft/direwolf20-1.19/start.sh" ]
then
  msgbox "Starting Minecraft Direwolf20 1.19"
  cd /config/minecraft/direwolf20-1.19
  ./start.sh
else
  msgbox "Minecraft Direwolf20 1.19 is missing, please install"
fi
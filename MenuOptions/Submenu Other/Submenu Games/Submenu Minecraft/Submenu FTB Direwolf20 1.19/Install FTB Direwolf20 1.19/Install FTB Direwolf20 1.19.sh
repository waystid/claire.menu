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
msgbox "Installing Minecraft FTB Direwolf20 1.19"

mkdir -p /config/minecraft/direwolf20-1.19
cd /config/minecraft/direwolf20-1.19
wget https://api.modpacks.ch/public/modpack/101/2296/server/linux
chmod +x linux
echo "eula=true" > eula.txt
./linux 101 --auto

msgbox "Minecraft Direwolf20 1.19 installed"
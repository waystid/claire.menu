#!/bin/bash
######################################################################
# Title   : Neofetch
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

logo
msgbox "Installing/Preparing Neofetch"
apt install neofetch -y
logo
msgbox "Neofetch"
neofetch
#!/bin/bash

######################################################################
# Title   : Update and Upgrade
# By      : DiscDuck
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

update_upgrade () {
   sudo apt update
   sudo apt upgrade -y
   msgbox "Please remember to reboot if the process did major Upgrades like the Kernel"
}

update_upgrade

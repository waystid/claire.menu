#!/bin/bash

######################################################################
# Title   : Claire Update - Updater for claire.menu
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Set hostname variable
name=$(hostname)

#Set folders
ifolder="/opt/ibracorp/ibramenu"
ifolder1="/opt/claire/claire.menu"

#Update claire.menu
gum spin --spinner monkey --show-output --title "Updating claire.menu" -- bash -c "rm -Rf /opt/claire/claire.menu/"
gum spin --spinner monkey --show-output --title "Updating claire.menu" -- bash -c "git clone -b main --single-branch https://github.com/waystid/claire.menu.git /opt/claire/claire.menu2"
gum spin --spinner monkey --show-output --title "Updating claire.menu" -- rsync -av "/opt/claire/claire.menu2/" "/opt/claire/claire.menu/"
rm -rf /opt/claire/claire.menu2

#Change permissions
find $ifolder1 -type f -iname "*.sh" -exec chmod +x {} \;

#Update ibramenu
gum spin --spinner line --show-output --title "Updating ibramenu" -- bash -c "rm -R /opt/ibracorp/ibramenu/"
gum spin --spinner line --show-output --title "Updating ibramenu" -- bash -c "git clone -b main --single-branch https://github.com/ibracorp/ibramenu.git /opt/ibracorp/ibramenu"
find $ifolder -type f -iname "*.sh" -exec chmod +x {} \;

# update the custom docker network use in all the containers
update_docker_network() {
  sed -i "s/^dockernet=.*$/dockernet=$name/" /opt/claire/claire.menu/.profile
  docker network create $name >/dev/null 2>&1
}

update_docker_network
# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

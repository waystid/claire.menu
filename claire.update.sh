#!/bin/bash

######################################################################
# Title   : Claire Update - Updater for claire.menu
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

#Update claire.menu
bash -c "rm -R /opt/claire/claire.menu/"
bash -c "git clone -b main --single-branch https://github.com/waystid/claire.menu.git $ifolder1"

# mkdir claire.temp
# mount -t nfs 192.168.1.18:/mnt/ssd/resources/code/claire/claire claire.temp
# rsync -av --progress "claire.temp/claire.menu/" "/opt/claire/claire.menu/"
# find $ifolder1 -type f -iname "*.sh" -exec chmod +x {} \;
# umount claire.temp
# rmdir claire.temp

#Change permissions
find $ifolder1 -type f -iname "*.sh" -exec chmod +x {} \;

#Update ibramenu
bash -c "rm -R /opt/ibracorp/ibramenu/"
bash -c "git clone -b main --single-branch https://github.com/ibracorp/ibramenu.git /opt/ibracorp/ibramenu"
find $ifolder -type f -iname "*.sh" -exec chmod +x {} \;

# update the custom docker network use in all the containers
update_docker_network() {
  sed -i "s/^dockernet=.*$/dockernet=$customnetwork/" /opt/claire/claire.menu/.profile
  docker network create $customnetwork >/dev/null 2>&1
}

update_docker_network
# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

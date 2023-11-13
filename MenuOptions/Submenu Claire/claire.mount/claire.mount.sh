#!/bin/bash
######################################################################
# Title   : Power Down
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# Set hostname variable
name=$(hostname)

logo
msgbox "claire.mount"
read -p "Would you like to create a /config folder and mount to NFS. (Be sure your IP address is in range) (y/N)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Create Working Directories
    mkdir /config /mnt/temp

    #Mount Temp Directory
    mount -t nfs 192.168.1.18:/mnt/ssd/resources/config/docker /mnt/temp

    #Create and mount config folder
    echo "192.168.1.18:/mnt/ssd/resources/config/docker/$name /config nfs4 defaults 0 0" | tee -a /etc/fstab
    mount /config

    #Unmount temp folder and create symlinks
    umount /mnt/temp
    mkdir -p /config/portainer/apps
    ln -s /config/portainer/apps/ /portainer
    ln -s /config/ /opt/appdata
fi

read -p "Would you like to create a /data folder and mount to CIFS. (Be sure your IP address is in range) (y/N)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    #Get password for data share
    # Turn off echo
    stty -echo
    # Prompt for input
    read -p "Enter your password: " password
    # Turn on echo
    stty echo
    echo "username=swaggaboss" | tee -a /root/.storage_credentials
    echo "password=$password" | tee -a /root/.storage_credentials
    # Mount data folder
    echo "#media" | tee -a /etc/fstab
    echo "//192.168.1.18/nimbus/data /data cifs noperm,rw,credentials=/root/.storage_credentials,uid=1000,gid=1000,file_mode=0660,dir_mode=0770,vers=3.0 0 0" | tee -a /etc/fstab
    mount /data
fi

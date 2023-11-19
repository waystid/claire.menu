#!/bin/bash
######################################################################
# Title   : claire.copy
# By      : Lu Cipher
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by CLAIRE.IO™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

logo
msgbox "claire.copy"

##### claire.mount #####
mkdir claire.temp

# Define the list of hosts and their corresponding mounts
hosts=(
    "greyfox:192.168.1.18:/mnt/ssd/config/greyfox"
    "club:192.168.1.18:/mnt/nimbus/configs/club"
    "elysium:192.168.1.18:/mnt/ssd/config/elysium"
    "essential:192.168.1.18:/mnt/ssd/config/essential"
    "splinter:192.168.1.18:/mnt/ssd/resources/config/docker/splinter"
    "loki:192.168.1.18:/mnt/nimbus/configs/loki"
    "old:192.168.1.18:/mnt/nimbus/configs/old"
    "casey:192.168.1.18:/mnt/ssd/resources/config/docker/casey"
    "ronin:192.168.1.18:/mnt/ssd/resources/config/docker/ronin"
    "raphael:192.168.1.18:/mnt/ssd/resources/config/docker/raphael"
    "leonardo:192.168.1.18:/mnt/ssd/resources/config/docker/leonardo"
    "michelangelo:192.168.1.18:/mnt/ssd/resources/config/docker/michelangelo"
    "april:192.168.1.18:/mnt/ssd/resources/config/docker/april"
    "aeris-resources:192.168.1.18:/mnt/ssd/resources/config/aeris"
    "mantic:192.168.1.18:/mnt/ssd/config/mantic"
    "ultron:192.168.1.18:/mnt/ssd/config/ultron"
    "thor:192.168.1.18:/mnt/ssd/config/thor"
    "odin:192.168.1.18:/mnt/ssd/config/odin"
    "ocelot:192.168.1.18:/mnt/ssd/config/ocelot"
    "aeris-ssd:192.168.1.18:/mnt/ssd/config/essential"
)

# Extract the hosts and mount paths from the list
hostnames=()
mount_paths=()
for host in "${hosts[@]}"; do
    hostnames+=($(echo $host | cut -d':' -f1))
    mount_paths+=($(echo $host | cut -d':' -f2-))
done

# Prompt user to select a host
echo "Select a host to mount:"
select choice in "${hostnames[@]}"; do
    if [[ -n $choice ]]; then
        # Find the corresponding mount path
        selected_mount_path=${mount_paths[$REPLY-1]}

        # Mount the selected choice to claire.temp
        mount -t nfs $selected_mount_path claire.temp

        echo "Mounted $choice to claire.temp"
        break
    else
        echo "Invalid choice. Please try again."
    fi
done

##### claire.copy #####
## Define source and destination directories
source_dir="claire.temp"
destination_dir="/config"

# List directories in /claire.temp and present a multi-selectable list
echo "Available directories in $source_dir:"
directories=($(find $source_dir -maxdepth 1 -type d -printf "%f\n"))
selected_directories=()

# Prompt user to select directories
PS3="Select directories to copy (space to select, enter to finish): "
select directory in "${directories[@]}"; do
    if [[ -n $directory ]]; then
        selected_directories+=("$directory")
    else
        break
    fi
done

# Use rsync to copy selected directories to /config
for directory in "${selected_directories[@]}"; do
    rsync -av --progress "$source_dir/$directory/" "$destination_dir/$directory/"
    echo "Directory '$directory' copied to '$destination_dir'"
done

#Unmount temp folder
umount claire.temp
rmdir claire.temp

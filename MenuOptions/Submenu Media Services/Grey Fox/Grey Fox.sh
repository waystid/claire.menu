#!/bin/bash

######################################################################
# Title   : Grey Fox
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

greyfox () {
  msgbox "Installing Starr Apps - Step 1 of 3" 
  # gum spin --spinner line --title "Installing Bazarr" -- ../Submenu The ARRs/Bazarr/Bazarr.sh
  "../Submenu The ARRs/Lidarr/Lidarr.sh"
  "../Submenu The ARRs/Radarr/Radarr.sh"
  "../Submenu The ARRs/Radarr 4K/Radarr 4K.sh"
  "../Submenu The ARRs/Readarr/Readarr.sh"
  "../Submenu The ARRs/Sonarr/Sonarr.sh"
  "../Submenu The ARRs/Sonarr 4K/Sonarr 4K.sh"
  "../Submenu The ARRs/Whisparr/Whisparr.sh"  
  
  msgbox "Installing Downloaders - Step 2 of 3"
  "../Submenu Download Services/qbittorrent/qbittorrent.sh"
  "../Submenu Download Services/ jdownloader-2/jdownloader-2.sh"
  "../Submenu Download Services/nzbget/nzbget.sh"
  "../Submenu Download Services/qbittorrent/qbittorrent.sh"
  "../Submenu Download Services/sabnzbd/sabnzbd.sh"
  "../Submenu Download Services/ytdl_material/ytdl_material.sh"
  
  msgbox "Installing Maintenance Services - Step 3 of 3"
  "../../Submenu Networking/Gluetun/Gluetun.sh"
  "../Submenu The ARRs/Prowlarr/Prowlarr.sh"
  "../Submenu Tools/Notifiarr/Notifiarr.sh"
  "../../Submenu Docker/Portainer/Portainer.sh"
  
  msgbox "All done. Press any key to continue"
}

greyfox
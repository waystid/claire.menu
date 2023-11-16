#!/bin/bash

######################################################################
# Title   : Grey Fox
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

greyfox () {
  msgbox "Installing Starr Apps - Step 1 of 3" 
  # gum spin --spinner line --title "Installing Bazarr" -- ../Submenu The ARRs/Bazarr/Bazarr.sh
  gum spin --spinner line --title "Installing Lidarr" -- ../Submenu The ARRs/Lidarr/Lidarr.sh
  gum spin --spinner line --title "Installing Prowlarr" -- ../Submenu The ARRs/Prowlarr/Prowlarr.sh
  gum spin --spinner line --title "Installing Radarr" -- ../Submenu The ARRs/Radarr/Radarr.sh
  gum spin --spinner line --title "Installing Radarr 4K" -- ../Submenu The ARRs/Radarr 4K/Radarr 4K.sh
  gum spin --spinner line --title "Installing Readarr" -- ../Submenu The ARRs/Readarr/Readarr.sh
  gum spin --spinner line --title "Installing Sonarr" -- ../Submenu The ARRs/Sonarr/Sonarr.sh
  gum spin --spinner line --title "Installing Sonarr 4K" -- ../Submenu The ARRs/Sonarr 4K/Sonarr 4K.sh
  gum spin --spinner line --title "Installing Whisparr" -- ../Submenu The ARRs/Whisparr/Whisparr.sh  
  
  msgbox "Installing Downloaders - Step 2 of 3"
  gum spin --spinner monkey --title "Installing JDownloader 2" -- ../Submenu Download Services/ jdownloader-2/jdownloader-2.sh
  gum spin --spinner monkey --title "Installing nzbget" -- ../Submenu Download Services/nzbget/nzbget.sh
  gum spin --spinner monkey --title "Installing qbittorrent" -- ../Submenu Download Services/qbittorrent/qbittorrent.sh
  gum spin --spinner monkey --title "Installing SABnzbd" -- ../Submenu Download Services/sabnzbd/sabnzbd.sh
  gum spin --spinner monkey --title "Installing qbittorrent" -- ../Submenu Download Services/qbittorrent/qbittorrent.sh
  gum spin --spinner monkey --title "Installing ytdl_material" -- ../Submenu Download Services/ytdl_material/ytdl_material.sh
  
  msgbox "Installing Maintenance Services - Step 3 of 3"
  gum spin --spinner meter --show-output --title "Installing gluetun" -- ../../Submenu Tools/gluetun/gluetun.sh
  gum spin --spinner monkey --title "Installing Notifiarr" -- ../Submenu Tools/Notifiarr/Notifiarr.sh
  gum spin --spinner monkey --title "Installing Dozzle" -- bash -c ../../Submenu Tools/Dozzle/Dozzle.sh
  gum spin --spinner monkey --title "Installing Portainer" -- bash -c ../../Submenu Docker/Portainer/Portainer.sh
  
  msgbox "All done. Press any key to continue"
}

greyfox
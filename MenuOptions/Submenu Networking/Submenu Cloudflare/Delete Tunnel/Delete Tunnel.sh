#!/bin/bash

######################################################################
# Title   : Cloudflare Tunnel Deletion
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

# Greetings
greetings () {
  logo
  msgbox "Cloudflare Tunnel Deletion"
}

# Tunnel Deletion
tunneldeletion () {
  cd /config/cloudflared
  docker run -it --rm --security-opt apparmor=unconfined -v /config/cloudflared:/home/nonroot/.cloudflared/ cloudflare/cloudflared tunnel delete -f lxc-tunnel
  docker compose down
  id=$(docker image ls -q cloudflare/cloudflared)
  docker image rm $id
  rm *.json
  rm cert.pem
}

# Execute
greetings
tunneldeletion
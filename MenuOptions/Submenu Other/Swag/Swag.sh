#!/bin/bash
######################################################################
# Title   : Install Swag
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

read -p "Your Domain (domain.com)            : " domain
read -p "Your Cloudflare API token           : " CF_API_TOKEN
# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# App Info
app="Swag"                                  # App Name
title="Swag"                                # Readable App Title
image="lscr.io/linuxserver/swag"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config" # Volumes
tp_app="Swag"                               # Theme Park App Name
# porte="8085"                                    # External Port
# porti="8080"                                    # Internal Port
extrapayload="    ports:
      - 443:443
      - 80:80
      - 81:81
    environment:
      - URL=$domain
      - SUBDOMAINS=wildcard
      - VALIDATION=dns
      - DNSPLUGIN=cloudflare
      - DOCKER_MODS'='linuxserver/mods:universal-docker|linuxserver/mods:swag-auto-proxy|linuxserver/mods:swag-cloudflare-real-ip|linuxserver/mods:swag-auto-reload|linuxserver/mods:swag-dashboard
      - DOCKER_HOST=dockerproxy
    cap_add:
      - NET_ADMIN
    "                                 # Extra Payload to add to the Compose add 4 spance to the top group for example environment: and 6 for the childs (if copy and pasting you just need to add the space to the parent).


# Execute
app
echo "dns_cloudflare_api_token = $CF_API_TOKEN" > /config/Swag/dns-conf/cloudflare.ini
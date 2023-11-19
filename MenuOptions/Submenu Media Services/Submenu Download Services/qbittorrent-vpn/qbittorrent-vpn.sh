#!/bin/bash
######################################################################
# Title   : Install Qbittorrent-vpn
# By      : DiscDuck, Taos15
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# Record lan ip to access WEBUI
read -p "Enter you lan Network EX. (192.168.1.0/24)            : " IP

# App Info
app="qbittorrent-vpn"                                  # App Name
title="qbittorrent-vpn"                                # Readable App Title
image="cr.hotio.dev/hotio/qbittorrent"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/config
      - /data/torrents:/media"                     # Volumes
tp_app="qbittorrent"                                # Theme Park App Name
porte="8080"                                   # External Port
porti="8080"                                   # Internal Port
porte2="8118"                                   # External Port
porti2="8118"                                   # Internal Port                                # Internal Port
extrapayload="    environment:
      - VPN_ENABLED=true
      - VPN_CONF=wg0
      - PRIVOXY_ENABLED=false
      - VPN_LAN_NETWORK=${IP} 
    cap_add:
      - NET_ADMIN
    sysctls:
      - net.ipv4.conf.all.src_valid_mark=1
      - net.ipv6.conf.all.disable_ipv6=1"
      #  - VPN_ADDITIONAL_PORTS=7878/tcp,9117/tcp  # for additional ports, Ex. Wanting to route traffic from other containers over the vpn

# Execute
app
sudo mkdir -p /config/qbittorrent-vpn/wireguard
sudo touch /config/qbittorrent-vpn/wireguard/wg0.conf

sudo tee <<-EOF > /config/qbittorrent-vpn/wireguard/wg0.conf
[Interface]
PrivateKey = supersecretprivatekey
Address = xx.xx.xxx.xxx/32
DNS = 1.1.1.1

[Peer]
PublicKey = publickey
AllowedIPs = 0.0.0.0/0
Endpoint = xxx.x.xxx.x:51820
EOF
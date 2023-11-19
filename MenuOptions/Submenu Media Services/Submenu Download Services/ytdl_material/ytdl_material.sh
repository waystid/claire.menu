#!/bin/bash
######################################################################
# Title   : Install ytdl_material
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/*

# App Info
app="ytdl_material"                                  # App Name
title="ytdl_material"                                # Readable App Title
image="tzahi12345/youtubedl-material:latest"     # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}/data:/app/appdata
      - /data/media/youtube/ytdl_material://app/downloads"                     # Volumes
tp_app="nzbget"                                # Theme Park App Name
porte="17442"                                   # External Port
porti="17442"                                   # Internal Port
extrapayload="    environment:
      ALLOW_CONFIG_MUTATIONS: 'true'
      ytdl_mongodb_connection_string: 'mongodb://192.168.1.29:27017'
      ytdl_use_local_db: 'false'
      write_ytdl_config: 'true'
    depends_on:
      - ytdl-mongo-db
  ytdl-mongo-db:
    container_name: ytdl-mongo-db
    image: mongo:4.4.6
    restart: unless-stopped
    logging:
      driver: json-file
    network_mode: bridge
    ports:
      - 27017:27017
    volumes:
      - /config/\${APP_NAME:?err}/db:/app/db
    networks:
      $dockernet:
      driver: bridge
      external: true
    "                                # Extra Payload to add to the Compose

# Execute
app
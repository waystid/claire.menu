#!/bin/bash
######################################################################
# Title   : Install Gitlab
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# App Info
app="gitlab-ce"                                  # App Name
title="Gitlab"                                # Readable App Title
image="gitlab/gitlab-ce:latest"             # Image and Tag
tp_app=""                               # Theme Park App Name
porte="8095"                                       # External Port
porti="80"
porte2="8445"
porti2="443"                                      # Internal Port

# App
local_appcreate () {
  msgbox "Installing $title..."
  mkdir -p /config/$app && cd /config/$app
  tee <<-EOF > .env
APP_NAME=$app
IMAGE=$image
TP_APP=$tp_app
PORTE=$porte
PORTI=$porti
PORTE2=$porte2
PORTI2=$porti2

EOF
  tee <<-EOF > compose.yaml
services:
  web:
    image: \${IMAGE:?err}
    container_name: \${APP_NAME:?err}
    network_mode: host
    env_file:
      - /config/.id.env
      - /config/.timezone.env
      - /config/.themepark.env
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        external_url https://git.waystid.dev
    volumes:
      - /config/\${APP_NAME:?err}/config:/etc/gitlab
      - /config/\${APP_NAME:?err}/logs:/var/log/gitlab
      - /resources/code:/var/opt/gitlab
    ports:
      - \${PORTE:?err}:${PORTI:?err}
      - \${PORTE2:?err}:${PORTI2:?err}  
    restart: unless-stopped
    hostname: git.waystid.dev
    security_opt:
      - apparmor:unconfined
  gitlab-runner:
    image: gitlab/gitlab-runner:alpine
    container_name: gitlab-runner    
    restart: always
    depends_on:
      - web
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /config/\${APP_NAME:?err}/gitlab-runner:/etc/gitlab-runner
EOF
  docker compose up -d --force-recreate
}

# List Links
local_appfinalization () {
  check_ibradashy
  logo
  msgbox "All Done! Here is the link to $title:"
  echo
  ip=$(hostname -I | awk '{print $1}')
  echo "$title: http://$ip:$porte"
  ibradashy
  msgbox "You can also find $title on your IBRACORP Dashy website:"
  echo "http://$ip:8086"
  echo
}

# Execute

# Local Docker
  if [ "$app" != "registry" ]; then
    #Update image file
    update_image_file="/data/media/resources/claire/update_images"
    
    # Check if the line is already in the file
    if ! grep -qF "$image" "$update_image_file"; then
      sudo chmod u+w $update_image_file
      echo "${image} | ${app}:${image_tag}" >> $update_image_file
    else
      echo "Line already exists in $update_image_file"
    fi
    # Execute local.docker function here
    local.docker
  else
    echo "Skipping local.docker function because app is set to 'registry'"
  fi

local_appcreate
local_appfinalization
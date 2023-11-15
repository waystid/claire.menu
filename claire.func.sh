#!/bin/bash
######################################################################
# Title   : Claire.Func - claire.menu functions
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# functions

# profile file
source /opt/claire/claire.menu/.profile
source /config/.traefik.env
# message box
msgbox() {
  # function expects a message and optional parameters
  # msgbox <Text> <width of box> <horizontal character for the box> <vertical character for the box>
  # If the box parameters are not given the full width will be used and = for horizontal and | for vertical character

  # checking if message is specified
  if [[ -z $1 ]]; then
    message="Your message could be here!"
  else
    message=$1
  fi
  # checking if message box width is specified
  if [[ -z $2 ]]; then
    box_width=$(tput cols)
  else
    box_width=$2
  fi
  # checking if horizontal character is specified
  if [[ -z $3 ]]; then
    box_hor="="
  else
    box_hor=$3
  fi
  # checking if vertical charater is specified
  if [[ -z $4 ]]; then
    box_vert="|"
  else
    box_vert=$4
  fi
  # calculating message box parameters
  msg_length=${#message}
  msg_half=$(($msg_length / 2))
  msg_start=$(((($box_width - 2) / 2) - $msg_half))
  msg_fill_left=$(($msg_start))
  msg_fill_right=$((($box_width - 2) - $msg_start - $msg_length))
  # generating strings for box
  box_outline_hor=$(printf %"$box_width"s | tr ' ' "$box_hor")
  msg_space_left=$(printf %"$msg_fill_left"s)
  msg_space_right=$(printf %"$msg_fill_right"s)
  # output
  echo
  echo $box_outline_hor
  echo "$box_vert$msg_space_left$message$msg_space_right$box_vert"
  echo $box_outline_hor
  echo
}

# claire.menu logo
logo() {
  version=$(cat "/opt/claire/claire.menu/version")
  tput clear
  tput bold
  tput setaf 1
  tee <<-EOF
        _       _                                       
    ___| | __ _(_)_ __ ___   _ __ ___   ___ _ __  _   _  ™
   / __| |/ _\` | | '__/ _ \ | '_ \` _ \ / _ \ '_ \| | | 
  | (__| | (_| | | | |  __/_| | | | | |  __/ | | | |_| |    Custom
   \___|_|\__,_|_|_|  \___(_)_| |_| |_|\___|_| |_|\__,_|    Version $version

$(lsb_release -sd) | CPU Threads: $(lscpu | grep "CPU(s):" | tail +1 | head -1 | awk '{print $2}') | IP: $(hostname -I | awk '{print $1}') | RAM: $(free -m | grep Mem | awk 'NR=1 {print $2}') MB
Become a Member and sponsor us: https://waystid.club
EOF
  tput sgr0
}

environment_check() {
  # Check for environment files or otherwise create them with defaults
  if [ ! -d "/config" ]; then
    mkdir -p /config
  fi
  # Timezone
  if [ ! -f "/config/.timezone.env" ]; then
    echo "TZ=UTC" >"/config/.timezone.env"
  fi
  # PUID and PGID
  if [ ! -f "/config/.id.env" ]; then
    echo "PUID=1000" >"/config/.id.env"
    echo "PGID=1000" >>"/config/.id.env"
  fi
  # traefik environment
  if [ ! -f "/config/.traefik.env" ]; then
    echo " " >"/config/.traefik.env"
  fi
  # theme.park
  if [ ! -f "/config/.themepark.env" ]; then
    echo "DOCKER_MODS=ghcr.io/gilbn/theme.park:\${TP_APP}" >"/config/.themepark.env"
    echo "TP_THEME=plex" >>"/config/.themepark.env"
  fi
}

# launch docker compose container
launchdocker() {
  target_folder=$1
  if [ ! -d $target_folder ]; then
    mkdir -p "$target_folder"
  fi
  cp -R * "$target_folder"
  docker compose -f "$target_folder/compose.yaml" up -d
}

# display README.md
readme() {
  if [ -f "README.md" ]; then
    mdless -P "README.md"
    read -p "Do you want to continue (y)? " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      return
    else
      return 1
    fi
  fi
}

# check if ibramenu is up-to-date
checkupdate() {
  version=$(cat "/opt/ibracorp/ibramenu/version")
  current=$(curl -s https://raw.githubusercontent.com/ibracorp/ibramenu/main/version)
  if [ ! $version = $current ]; then
    msgbox "You IBRAMENU is not up-to-date. Use 'ibraupdate' to update."
  fi
}

# claire.motd
claire.motd() {
  chmod -x /etc/update-motd.d/*
  tee <<-'EOF' >/etc/update-motd.d/01-claire
#!/bin/bash
######################################################################
# Title   : Claire.Menu
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Waystid
######################################################################
tee <<-EOF
        _       _                                       
    ___| | __ _(_)_ __ ___   _ __ ___   ___ _ __  _   _  ™
   / __| |/ _\` | | '__/ _ \ | '_ \` _ \ / _ \ '_ \| | | 
  | (__| | (_| | | | |  __/_| | | | | |  __/ | | | |_| |    Custom
   \___|_|\__,_|_|_|  \___(_)_| |_| |_|\___|_| |_|\__,_|    Version $version

$(lsb_release -sd) | CPU Threads: $(lscpu | grep "CPU(s):" | tail +1 | head -1 | awk  '{print $2}') | IP: $(hostname -I | awk '{print $1}') | RAM: $(free -m | grep Mem | awk 'NR=1 {print $2}') MB
Become a Member and sponsor us: https://waystid.club
Type 'claire.menu' to launch claire.menu
EOF
  echo "EOF" >>/etc/update-motd.d/01-claire
  chmod +x /etc/update-motd.d/01-claire
}

local.docker() {
  # Install jq
  if ! command -v jq &> /dev/null; then
    sudo apt-get update
    sudo apt-get install jq
  fi

  image_tag=$(echo $image | awk -F':' '{print $NF}')
  registry_url="192.168.1.10:5000/claire/"

  # Check if the image_name contains the local registry address
  if [[ "${image}" == *"${registry_url}"* ]]; then
    echo "Image ${image} is already in the local registry."
  else
    # Check if the image exists in the local registry
    if curl -s "${registry_url}v2/${app}/tags/list" | jq -e '.tags' > /dev/null; then
      echo "Image ${image} already exists in the local registry with tag ${image_tag}."
      image="${registry_url}${app}:${image_tag}"
    else
    # If the image doesn't exist, pull it from the registry and push it to the local registry
    # Pull the original image
    docker pull $image

    # Tag the image for the local registry
    docker tag $image "${registry_url}${app}:${image_tag}"

    # Push the image to the local registry
    docker push "${registry_url}${app}:${image_tag}"

    # Set the new image variable
    image="${registry_url}${app}:${image_tag}"
    fi
  fi
}

# App Greetings
appgreetings() {
  logo
  msgbox "$title Installer"
  }

# App
appcreate() {
  msgbox "Installing $title..."
  mkdir -p /config/$app && cd /config/$app
  tee <<-EOF >.env
APP_NAME=$app
IMAGE=$image
TP_APP=$tp_app
PORTE=$porte
PORTI=$porti
PORTE2=$porte2
PORTI2=$porti2
PORTE3=$porte3
PORTI3=$porti3
EOF
  tee <<-EOF >compose.yaml
services:
  service-name:
    image: \${IMAGE:?err}
    container_name: \${APP_NAME:?err}
    env_file:
      - /config/.id.env
      - /config/.timezone.env
      - /config/.traefik.env
EOF
  if [ ! -z "$tp_app" ]; then
    echo "      - /config/.themepark.env" >>compose.yaml
  fi
  if [ ! -z "$volumes" ]; then
    echo "$volumes" >>compose.yaml
  fi
  if [ ! -z "$porti" ]; then
    tee <<-EOF >>compose.yaml
    ports:
      - \${PORTE:?err}:\${PORTI:?err}
EOF
  fi
  if [ ! -z "$porti2" ]; then
    tee <<-EOF >>compose.yaml
      - \${PORTE2:?err}:\${PORTI2:?err}
EOF
  fi
  if [ ! -z "$porti3" ]; then
    tee <<-EOF >>compose.yaml
      - \${PORTE3:?err}:\${PORTI3:?err}
EOF
  fi

  tee <<-EOF >>compose.yaml
    networks:
      - $dockernet
    restart: unless-stopped
    security_opt:
      - apparmor:unconfined
$extrapayload
networks:
  $dockernet:
    driver: bridge
    external: true
EOF
  docker compose up -d --force-recreate
}

# List Links
appfinalization() {
  check_ibradashy
  logo
  msgbox "All Done! Here is the link to $title:"
  echo
  ip=$(hostname -I | awk '{print $1}')
  echo "$title: http://$ip:$porte/"
  ibradashy
  msgbox "You can also find $title on your IBRACORP Dashy website:"
  echo "http://$ip:8086"
  echo
}

# App Complete
app() {
  # Local Docker
  if [ "$app" != "registry" ]; then
    # Execute local.docker function here
    echo "${image_name}" >> /opt/claire/claire.menu/update/docker.txt
    local.docker
  else
    echo "Skipping local.docker function because app is set to 'registry'"
  fi

  # Execute appcreate function
  appgreetings
  appcreate
  appfinalization
}

# IBRACORP Dashy
ibradashy() {
  if ! grep "^      - title: $title$" "/config/ibradashy/conf.yml" >/dev/null 2>&1; then
    position=$(expr $(grep -n "name: IBRAMENU" /config/ibradashy/conf.yml | grep -Eo '^[^:]+') + 3)
    sed -i "$position i \      - title: $title\\
        description: Click to launch $title\\
        icon: favicon\\
        url: http://$ip:$porte" /config/ibradashy/conf.yml
    docker compose -f /config/ibradashy/compose.yaml up -d --force-recreate >/dev/null 2>&1
  fi
}

# Check IBRACORP Dashy
check_ibradashy() {
  if [ ! -d "/config/ibradashy" ]; then
    mkdir -p "/config/ibradashy"
  fi
  if [ ! -f "/config/ibradashy/.env" ]; then
    tee <<-EOF >"/config/ibradashy/.env"
APP_NAME=ibradashy
IMAGE=lissy93/dashy:latest
TP_APP=
PORTE=8086
PORTI=80
EOF
  fi
  if [ ! -f "/config/ibradashy/conf.yml" ]; then
    tee <<-EOF >"/config/ibradashy/conf.yml"
pageInfo:
  title: Claire Menu
sections:
  - name: claire.menu
    icon: far fa-rocket
    items:
# Claire Menu added
    displayData:
      sortBy: alphabetical
      rows: 1
      cols: 1
      collapsed: false
      hideForGuests: false
  - name: Information
    displayData:
      sortBy: alphabetical
      rows: 1
      cols: 1
      collapsed: false
      hideForGuests: false
    widgets:
      - type: image
        options:
          imagePath: https://ibramenu.io/wp-content/uploads/2022/08/ibramenu_concept._logo_crop-300x140.png
    items:
      - title: Claire Menu
        description: Website
        icon: https://ibracorp.io/favicon.ico
        url: https://ibramenu.io
      - title: IBRACORP
        description: Main Website
        icon: favicon
        url: https://ibracorp.io
      - title: GitHub
        description: IBRAMENU on GitHub
        icon: favicon
        url: https://github.com/ibracorp/ibramenu
      - title: Feedback
        description: IBRAMENU Feedback and Voting
        icon: https://ibracorp.io/favicon.ico
        url: https://feedback.ibracorp.io/ibramenu
  - name: Services
    displayData:
      sortBy: default
      rows: 1
      cols: 1
      collapsed: false
      hideForGuests: false
    widgets:
      - type: iframe
        options:
          url: https://i.ibracorp.io/services
          frameHeight: 440
appConfig:
  theme: Oblivion
  language: en
  layout: auto
  iconSize: large
EOF
  fi
  if [ ! -f "/config/ibradashy/compose.yaml" ]; then
    tee <<-EOF >"/config/ibradashy/compose.yaml"
services:
  service-name:
    image: \${IMAGE:?err}
    container_name: \${APP_NAME:?err}
    env_file:
      - /config/.id.env
      - /config/.timezone.env
    volumes:
      - ./conf.yml:/app/public/conf.yml
    ports:
      - \${PORTE:?err}:\${PORTI:?err}
    networks:
      - $dockernet
    restart: unless-stopped
    security_opt:
      - apparmor:unconfined

networks:
  $dockernet:
    driver: bridge
    external: true
EOF
  fi
  if [ ! $(docker ps | grep ibradashy) ]; then
    msgbox "Installing/Updating IBRADASHY"
    docker compose -f /config/ibradashy/compose.yaml up -d --force-recreate >/dev/null 2>&1
  fi
}

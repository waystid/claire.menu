#!/bin/bash
######################################################################
# Title   : Install Dockge
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh
source /opt/claire/claire.menu/claire.func/sauce.sh

# App Info
app="dockge"                     # App Name
title="Dockge"                   # Readable App Title
image="louislam/dockge:1"        # Image and Tag
volumes="    volumes:
      - /config/\${APP_NAME:?err}:/app/data
      - /var/run/docker.sock:/var/run/docker.sock" # Volumes
porte="5001"                          # External Port
porti="5001"                          # Internal Port
extrapayload="
            # If you want to use private registries, you need to share the auth file with Dockge:
      # - /root/.docker/:/root/.docker

      # Your stacks directory in the host (The paths inside container must be the same as the host)
      # ⚠️⚠️ If you did it wrong, your data could end up be written into a wrong path.
      # ✔️✔️✔️✔️ CORRECT EXAMPLE: - /my-stacks:/my-stacks (Both paths match)
      # ❌❌❌❌ WRONG EXAMPLE: - /docker:/my-stacks (Both paths do not match)
      #- /opt/stacks:/opt/stacks
    #environment:
      # Tell Dockge where is your stacks directory
      #- DOCKGE_STACKS_DIR=/opt/stacks"                       # Extra Payload to add to the Compose

# Execute
app
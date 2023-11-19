#!/bin/bash
######################################################################
# Title   : Install theme.park registry
# By      : Lu Cipher, CEO
# License : General Public License GPL-3.0-or-later
# Another fine product brought to you by Claire™
######################################################################

# Include claire.func for all the awesome functions
source /opt/claire/claire.menu/claire.func.sh

logo
original_image=$(gum input --prompt "Original image" --placeholder "Original docker image")

# Define the source image and destination repo
TARGET_REPO="192.168.1.10:5000/claire/theme.park"

# Pull the Docker image from GitHub
echo "Pulling Docker image from GitHub..."
docker pull $original_image
# Tag the Docker image with the address of the local registry
echo "Tagging Docker image for local repository..."
docker tag $original_imageE $TARGET_REPO

# Push the Docker image to the local repository
echo "Pushing Docker image to local repository..."
docker push $TARGET_REPO

echo "Process completed."
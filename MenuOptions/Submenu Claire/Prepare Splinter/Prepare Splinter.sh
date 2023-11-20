#!/bin/bash

# Navigate to the /config directory
cd /config

# Delete everything in /config except /plex and /code-server
find . -mindepth 1 -maxdepth 1 ! -name "plex" ! -name "code-server" -exec rm -rf {} \;
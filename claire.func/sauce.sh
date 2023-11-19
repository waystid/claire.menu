#!/bin/bash

filebrowser() {
  db_file="/config/$app/$app.db"

  # Ensure parent directories exist
  mkdir -p "$(dirname "$db_file")"

  # Create the file if it doesn't exist
  if [ ! -e "$db_file" ]; then
    rsync -avh file-browser.db /config/$app/$app.db
  fi
}
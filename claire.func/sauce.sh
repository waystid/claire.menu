#!/bin/bash

filebrowser() {
  db_file="/config/filebrowser/filebrowser.db"

  # Ensure parent directories exist
  mkdir -p "$(dirname "$db_file")"

  # Create the file if it doesn't exist
  if [ ! -e "$db_file" ]; then
    touch "$db_file"
  fi
}
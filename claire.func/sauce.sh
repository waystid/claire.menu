#!/bin/bash

filebrowser(){
  db_file="/config/filebrowser/filebrowser.db"

  if [ ! -e "$db_file" ]; then
    touch ~/filebrowser.db
    mkdir -p /config/filebrowser/
    mv ~/filebrowser.db "$db_file"
  fi
}
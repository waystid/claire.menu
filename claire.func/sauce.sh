#!/bin/bash

ActivePieces() {
    cd /config
    mkdir -p /config/activepieces
    git clone https://github.com/activepieces/activepieces.git
    cd activepieces
    sh tools/deploy.sh
    docker compose -p activepieces up
    ngrok config add-authtoken 2YPNtvS37wiFq6SB8BP7zpKOEcs_78UD6r9YoQxDxnas5diUu
    
}

claire.compose() {
    
}
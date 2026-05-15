#!/bin/bash


./build-pages.sh

# Configuration
HOST="geospatial.ncsu.edu"
USER="geoforall@geospatial.ncsu.edu"
LOCAL_DIR="./build/"   # adjust to your local folder
REMOTE_DIR="/"          # adjust to remote path

lftp -u "$USER" "$HOST" <<EOF
set ftp:ssl-allow yes
set ssl:verify-certificate no
mirror -R --verbose "$LOCAL_DIR" "$REMOTE_DIR"
quit
EOF
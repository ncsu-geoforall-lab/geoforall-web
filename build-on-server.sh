#!/bin/sh

# Uploads the changes to the afs space on server.
# You will be asked for your password to server if you don't use ssh key.
# On server you need to use ssh key to access NCSU GitHub.

if [ $# -ne 1 ]; then
    echo 1>&2 "Usage: $0 username"
    exit 1
fi

# exit on any error
set -e

USERNAME=$1
DESTDIR=.
WEBDIR=/afs/unity.ncsu.edu/www/cnr/gis/
WORKDIR=osgeorel-web-build
REPDIR=osgeorel-web

# it does not clean the old directory

ssh $USERNAME@ras01.cos.ncsu.edu "
cd $WORKDIR
cd $REPDIR
git pull
./build-pages.sh
cd ..
# only PHP index is supported
cp osgeorel/index.html osgeorel/index.php;
cp --recursive --verbose osgeorel $WEBDIR;
";


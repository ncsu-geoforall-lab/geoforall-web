#!/bin/sh

# Uploads the changes to the afs space on server.
# You need to have ../osgeorel directory with builded pages.
# You will be asked for your password twice.

if [ $# -ne 1 ]; then
    echo 1>&2 "Usage: $0 username"
    exit 1
fi

# exit on any error
set -e

USERNAME=$1
DESTDIR=.
WEBDIR=/afs/unity.ncsu.edu/www/cnr/gis/

cd ..
tar czvf osgeorel.tar.gz osgeorel

scp osgeorel.tar.gz $USERNAME@ras01.cos.ncsu.edu:$DESTDIR

# it does not clean the old directory

ssh $USERNAME@ras01.cos.ncsu.edu "
tar xvf osgeorel.tar.gz;
cp osgeorel/index.html osgeorel/index.php;
cp --recursive osgeorel $WEBDIR;
";


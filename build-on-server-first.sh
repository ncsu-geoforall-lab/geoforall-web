#!/bin/sh

# Uploads the changes to the afs space on server.
# You will be asked for your password to server once.
# Moreover, you will be asked for your user name and password for
# NCSU GitHub.

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
mkdir $WORKDIR
cd $WORKDIR
mkdir osgeorel;
git clone git@github.ncsu.edu:osgeorel/osgeorel-web.git $REPDIR;
cd $REPDIR
./build-pages.sh
cd ..
# only PHP index is supported
cp osgeorel/index.html osgeorel/index.php;
cp --recursive --verbose osgeorel $WEBDIR;
";


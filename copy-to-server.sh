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
WEBDIR=/afs/unity.ncsu.edu/www/cnr/gis/osgeorel
DISTNAME=osgeorel
TARNAME=$DISTNAME.tar.gz
BUIDDIR=build

tar czvf $TARNAME $BUIDDIR

scp $TARNAME.tar.gz $USERNAME@ras01.cos.ncsu.edu:$DESTDIR

# it does not clean the old directory

ssh $USERNAME@ras01.cos.ncsu.edu "
tar xvf $TARNAME
cp $DISTNAME/index.html $DISTNAME/index.php
cp --recursive --update --no-target-directory --verbose $DISTNAME $WEBDIR
";


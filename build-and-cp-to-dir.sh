
usage_fail() {
    echo >&2 "$@"
    echo >&2 "Usage: $0 dir_with_web_eg_mounted_ftp"
    echo >&2 "Example: $0 /run/user/1000/gvfs/ftp:host=geospatial.ncsu.edu/"
    exit 1
}

if [ $# -ne 1 ]
then
    usage_fail "Exactly one argument must be given."
fi

WEBDIR=$1

BUIDDIR=build

./build-pages.sh

# only PHP index is supported
# hopefully not needed now
# cp $BUIDDIR/index.html $BUIDDIR/index.php

# it does not clean the old files
# but should run faster if the same files already exists
cp --recursive --update --no-target-directory --verbose $BUIDDIR $WEBDIR

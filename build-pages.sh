#!/bin/sh

# builds pages from source

OUTDIR=build

mkdir -p $OUTDIR

for FILE in `ls *.html|grep -v foot|grep -v head`
do
    cat head.html > $OUTDIR/$FILE
    echo "<!-- This is a generated file. Do not edit. -->" >> $OUTDIR/$FILE
    cat $FILE >> $OUTDIR/$FILE
    cat foot.html >> $OUTDIR/$FILE
done

# for backwards compatibility
cp $OUTDIR/tangible-landscape.html $OUTDIR/tangeoms.html

for FILE in *.css *.png *.json *.js
do
    cp --update $FILE $OUTDIR
done

for DIR in publications_pictures courses_pictures projects_pictures software_pictures logos publications elastislide foss4g-2014-spatio
do
    cp --update --recursive $DIR $OUTDIR
done

#!/bin/sh

OUTDIR=../osgeorel

for FILE in index.html publications.html about.html courses.html software.html projects.html contact.html
do
    cat head.html > $OUTDIR/$FILE
    echo "\n<!-- This is a generated file. Do not edit. -->\n" >> $OUTDIR/$FILE
    cat $FILE >> $OUTDIR/$FILE
    cat foot.html >> $OUTDIR/$FILE
done

for FILE in *.css *.png *.json *.js
do
    cp --update $FILE $OUTDIR
done

for DIR in publication_pictures courses_pictures logos pubpdf
do
    cp --update --recursive $DIR $OUTDIR
done


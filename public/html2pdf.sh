#!/bin/sh

for file in `ls *.html`
do
    echo "Creating $file.pdf ..."
    phantomjs rasterize.js $file $file.pdf A4
done

#!/bin/sh

# Collect HTML files in current directory, 
# convert them into PDF with a script (rasterize.js) and PhantomJS.

for file in `ls *.html`
do
    echo "Creating $file.pdf ..."
    phantomjs rasterize.js $file ~/Dropbox/Public/railstutorial.jp/$file.pdf A4
done

#!/bin/sh

for file in `ls *.html`
do
    mv $file ../../public/books/3.2/$file
    echo "move archive/ja/$file to ../../public/books/3.2/$file"
done

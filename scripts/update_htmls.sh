#!/bin/sh

for file in `ls *.html`
do
    mv $file ../../public/$file
    echo "move archive/ja/$file to ../../public/$file"
done

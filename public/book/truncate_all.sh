#!/bin/sh

rm *fragment.html
echo "deleted *fragment.html"
for file in `ls *.html`
do
    ./truncate.sh $file > ${file%.*}_fragment.html
    echo "truncated $file"
done

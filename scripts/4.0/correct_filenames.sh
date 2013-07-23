#!/bin/sh

# Correct filenames in the 'chapter_list.txt' and TOC.

i=0
for chapter in `cat chapter_list.txt`
do
    i=`expr $i + 1`
    Target="Rev3: Chapter$i: $chapter.html"
    mv "$Target" "${chapter}.html.original"
    echo "Rename: '$Target' \t=> '${chapter}.html.original'"
done
mv "Rev3: Table of Contents.html" _contents.html.original

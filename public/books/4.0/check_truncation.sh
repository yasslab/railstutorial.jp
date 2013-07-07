#!/bin/sh

# Download and update HTML files in the current directory.

for chapter in `cat ../chapter_list.txt`
do
    #head -284 $chapter | tail
    tail -45 $chapter | head
    echo ""
    echo "=============================================================="
done


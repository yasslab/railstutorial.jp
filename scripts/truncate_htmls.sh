#!/bin/sh

# Truncate all html files w/ truncate.sh

for chapter in `cat chapter_list.txt`
do
    ../../scripts/truncate.sh $chapter.html > ${chapter%.*}_fragment.html
    echo "truncated: $chapter.html \t -> ${chapter}_fragment.html"

    # Create a single chapter HTML file
    cat _head.html                  >  $chapter.html
    cat ${chapter%.*}_fragment.html >> $chapter.html
    cat _foot.html                  >> $chapter.html
    echo "Created: '$chapter.html'"
done

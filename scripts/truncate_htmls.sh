#!/bin/sh

# Truncate all html files w/ truncate.sh

for chapter in `cat chapter_list.txt`
do
    ../../scripts/truncate.sh $chapter.html > ${chapter%.*}_fragment.html
    echo "truncated: $chapter.html \t -> ${chapter}_fragment.html"
done

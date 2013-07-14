#!/bin/sh

# Download and update HTML files from 'chapter_list.txt'.

for chapter in `cat ../chapter_list.txt`
do
    cat ../_head.html               >  "$chapter".html
    cat "$chapter"_fragment.html    >> "$chapter".html
    cat ../_foot.html               >> "$chapter".html
    echo made $chapter.html a single chapter
done

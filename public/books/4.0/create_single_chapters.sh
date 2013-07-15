#!/bin/sh

# Add header/footer to each chapter,
# and complete each chapter as a HTML file.

for chapter in `cat ../chapter_list.txt`
do
    cat ../_head.html               >  "$chapter".html
    cat "$chapter"_fragment.html    >> "$chapter".html
    cat ../_foot.html               >> "$chapter".html
    echo made $chapter.html a single chapter
done

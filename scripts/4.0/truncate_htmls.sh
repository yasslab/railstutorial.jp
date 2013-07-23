#!/bin/sh

# Create truncated files in the 'chapter_list.txt' as a "#{chapter}_fragment.html".

for chapter in `cat chapter_list.txt`
do
    Start=`grep -n -w 'id="top"' $chapter.html | cut -d ':' -f1`
    End=`  grep -n -w 'id="book_bottom"' $chapter.html | cut -d ':' -f1`
    End=`  expr $End - 3`
    cat $chapter.html | head -n $End | tail -n +$Start > "$chapter"_fragment.html
    echo truncated: $chapter.html "\t"-\> "$chapter"_fragment.html
done
mv _contents_fragment.html _contents.html.erb

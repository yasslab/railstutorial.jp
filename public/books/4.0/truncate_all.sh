#!/bin/sh

# Create truncated files in the 'chapter_list.txt' as a "#{chapter}_fragment.html".

for chapter in `cat ../chapter_list.txt`
do
    Line=`cat $chapter.html | awk 'END {print NR }'`
    Start=284
    End=`expr $Line - 45`
    cat $chapter.html | head -n $End | tail -n +$Start > "$chapter"_fragment.html
    echo truncated: $chapter.html "\t"-\> "$chapter"_fragment.html
done

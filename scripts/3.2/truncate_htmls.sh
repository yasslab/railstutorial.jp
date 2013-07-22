#!/bin/sh

# Truncate all html files w/ truncate.sh

for chapter in `cat chapter_list.txt`
do
    Target="${chapter}_corrected.html"
    Start=`grep -n -w 'id="top"' $Target | cut -d ':' -f1`
    End=`  grep -n -w '</body>'  $Target | cut -d ':' -f1`
    End=`expr $End - 2`
    cat $Target | head -n $End | tail -n +$Start > ${chapter}_fragment.html
    echo "truncated: $Target \t -> ${chapter}_fragment.html"

    # Create a single chapter HTML file
    cat _head.html                  >  $chapter.html
    cat ${chapter%.*}_fragment.html >> $chapter.html
    cat _foot.html                  >> $chapter.html
    echo "Created: '$chapter.html'"
done

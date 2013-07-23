#!/bin/sh

# Create truncated files in the 'chapter_list.txt' as a "#{chapter}_fragment.html".

# for chapters
for chapter in `cat chapter_list.txt`
do
    Start=`grep -n -w 'id="top"' $chapter.html | cut -d ':' -f1`
    End=`  grep -n -w '</body>' $chapter.html | cut -d ':' -f1`
    End=`  expr $End - 2`
    cat $chapter.html | head -n $End | tail -n +$Start > "$chapter"_fragment.html
    echo truncated: $chapter.html "\t"-\> "$chapter"_fragment.html
done

# for table of contents
chapter="_contents"
Start=`grep -n -w 'class="title"' $chapter.html | cut -d ':' -f1`
End=`  grep -n -w '</body>' $chapter.html | cut -d ':' -f1`
End=`  expr $End - 2`
cat $chapter.html | head -n $End | tail -n +$Start > "$chapter"_fragment.html
echo truncated: $chapter.html "\t"-\> "$chapter"_fragment.html
mv ${chapter}_fragment.html $chapter.html.erb

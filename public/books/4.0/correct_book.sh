#!/bin/sh

# Collect html files in the current directory,
# then apply the following patches to each file:
#   - Change absolute links into relative ones.
#   - Align LICENSE by adding <br> tags.
#   - Replace specific terminologies with appropriate Japanese ones.

re_array=("s/href=\"(.+?)([?|#])/href=\"$2/g" \
)

for chapter in `ls book*`
do
    cp $chapter.html $chapter.modified_0.html
    i=0
    for re in "${re_array[@]}"
    do
	cat $chapter.modified_$i.html | sed -e "$re" > $chapter.modified_`expr $i + 1`.html
        rm  $chapter.modified_$i.html
	i=`expr $i + 1`
    done
    
    mv $chapter.modified_$i.html $chapter.html

    echo "corrected: Chapter '$chapter'"
done

#!/bin/sh

# Collect html files in the current directory,
# then apply the following patches to each file:
#   - Change absolute links into relative ones.
#   - Align LICENSE by adding <br> tags.
#   - Replace specific terminologies with appropriate Japanese ones.

re_array=( \
    "s/http:\/\/railstutorial.jp\/screencasts/http:\/\/railstutorial.org\/screencasts/g" \
    "s/http:\/\/railstutorial.jp\/help/http:\/\/railstutorial.org\/help/g" \
    "s/http:\/\/railstutorial.jp\/books\/4.0/\/chapters/g" \
    "s/v3.2.13\/v3.2.13/v3.2.13/g"
    )
#          "s/railstutorial.org/railstutorial.jp/g" \
#          "s/chapters\/images/images/g" \
#          "s/chapters\/pygments.css/stylesheets\/pygments.css/g" \
#          "s/chapters\/polytexnic.css/stylesheets\/polytexnic.css/g" \
#          "s/active_record_validations_callbacks/v3.2.13\/active_record_validations_callbacks/g" \


## Needless regular expressions for Rails 4.0

for chapter in `cat chapter_list.txt`
do
    cp $chapter.html.original $chapter.modified_0.html
    i=0
    for re in "${re_array[@]}"
    do
	cat $chapter.modified_$i.html | sed -e "$re" > $chapter.modified_`expr $i + 1`.html
        rm  $chapter.modified_$i.html
	i=`expr $i + 1`
    done

    for ch in `cat chapter_list.txt`
    do
	cat $chapter.modified_$i.html | sed -e \
	    "s/href=\"\/chapters\/$ch\.html/href=\"\/chapters\/$ch/g" \
	    > $chapter.modified_`expr $i + 1`.html
        rm  $chapter.modified_$i.html
	i=`expr $i + 1`
    done
    
    mv $chapter.modified_$i.html $chapter.html

    echo "corrected: Chapter '$chapter'"
done

chapter="_contents"
cp $chapter.html.original $chapter.modified_0.html
i=0
for re in "${re_array[@]}"
do
    cat $chapter.modified_$i.html | sed -e "$re" > $chapter.modified_`expr $i + 1`.html
    rm  $chapter.modified_$i.html
    i=`expr $i + 1`
done

mv $chapter.modified_$i.html $chapter.html

echo "corrected: Chapter '$chapter'"

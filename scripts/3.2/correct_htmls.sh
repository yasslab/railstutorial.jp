#!/bin/sh

# Collect html files in the current directory,
# then apply the following patches to each file:
#   - Change absolute links into relative ones.
#   - Align LICENSE by adding <br> tags.
#   - Replace specific terminologies with appropriate Japanese ones.

re_array=("s/http:\/\/railstutorial-ja.herokuapp.com/\/chapters/g" \
          "s/chapters\/images/images/g" \	  
          "s/chapters\/pygments.css/stylesheets\/pygments.css/g" \
          "s/chapters\/polytexnic.css/stylesheets\/polytexnic.css/g" \
          "s/,FITNESS/,<\/br>FITNESS/g" \
	  "s/WHETHER/<\/br>WHETHER/g" \
	  "s/IN CONNECTION WITH/<\/br>IN CONNECTION WITH/g" \
	  "s/フルサイズ/拡大/g" \
	  "s/テストドリブン/テスト駆動/g" \
	  "s/active_record_validations_callbacks/v3.2.13\/active_record_validations_callbacks/g" \
)

for chapter in `cat chapter_list.txt`
do
    cp $chapter.html.original $chapter.modified_0
    i=0
    for re in "${re_array[@]}"
    do
	cat $chapter.modified_$i | sed -e "$re" > $chapter.modified_`expr $i + 1`
	i=`expr $i + 1`
    done
    
    if [ $? -eq 0 ]; then
        mv $chapter.modified_$i ${chapter}_corrected.html
    fi

    echo "corrected: $chapter.html.original \t -> $chapter.html"
done

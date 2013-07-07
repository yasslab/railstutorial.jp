#!/bin/sh

# Collect html files in the current directory,
# then apply the following patches to each file:
#   - Change absolute links into relative ones.
#   - Align LICENSE by adding <br> tags.
#   - Replace specific terminologies with appropriate Japanese ones.

re_array=("s/railstutorial.org/railstutorial.jp/g" \
          "s/chapters\/images/images/g" \	  
          "s/chapters\/pygments.css/stylesheets\/pygments.css/g" \
          "s/chapters\/polytexnic.css/stylesheets\/polytexnic.css/g" \
          "s/,FITNESS/,<\/br>FITNESS/g" \
	  "s/WHETHER/<\/br>WHETHER/g" \
	  "s/IN CONNECTION WITH/<\/br>IN CONNECTION WITH/g" \
	  "s/active_record_validations_callbacks/v3.2.13\/active_record_validations_callbacks/g" \
)

for file in `ls *.html`
do
    cp $file $file.modified_0
    i=0
    for re in "${re_array[@]}"
    do
	cat $file.modified_$i | sed -e "$re" > $file.modified_`expr $i + 1`
        rm  $file.modified_$i
	i=`expr $i + 1`
    done
    
    mv $file.modified_$i $file

    echo "corrected $file"
done

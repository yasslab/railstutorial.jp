#!/bin/sh

# Collect html files in the current directory,
# then apply the following patches to each file:
#   - change absolute links, 'http://railstutorial-ja' into relative ones.
#   - add </br> tags to LICENSE

for file in `ls *.html`
do
    cat $file | sed -e "s/http:\/\/railstutorial-ja.herokuapp.com/\/chapters/g" > $file.modified_1
    cat $file.modified_1 | sed -e "s/フルサイズ/拡大/g" > $file.modified_2
    cat $file.modified_2 | sed -e "s/テストドリブン/テスト駆動/g" > $file.modified_3
    echo "corrected $file"
    if [ $? -eq 0 ]; then
	mv $file.modified_3 $file
    fi
done

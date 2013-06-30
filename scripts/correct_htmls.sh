#!/bin/sh

# Collect html files in the current directory,
# then apply the following patches to each file:
#   - replace a link of 'railstutorial-ja...' with 'railstutorial.jp'.
#   - add </br> tags to LICENSE

for file in `ls *.html`
do
    cat $file | sed -e "s/railstutorial-ja.herokuapp.com\//railstutorial.jp\/chapters\//g" > $file.modified_1
    cat $file.modified_1 | sed -e "s/,FITNESS/,<\/br>FITNESS/g" > $file.modified_2
    cat $file.modified_2 | sed -e "s/WHETHER/<\/br>WHETHER/g" > $file.modified_3
    cat $file.modified_3 | sed -e "s/IN CONNECTION WITH/<\/br>IN CONNECTION WITH/g" > $file.modified_4
    cat $file.modified_4 | sed -e "s/フルサイズ/拡大/g" > $file.modified_5
    cat $file.modified_5 | sed -e "s/テストドリブン/テスト駆動/g" > $file.modified_6
    echo "corrected $file"
    if [ $? -eq 0 ]; then
	mv $file.modified_6 $file
    fi
done

#!/bin/sh

cd ~/rails_tutorial_translation_2nd_ed/public

for file in `ls *.html`
do
    cat $file | sed -e "s/railstutorial-ja.herokuapp.com/railstutorial.jp/g" > $file.modified

    if [ $? -eq 0 ]; then
	mv $file.modified $file
    fi
done

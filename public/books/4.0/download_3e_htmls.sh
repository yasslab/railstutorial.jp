#!/bin/sh

# Download and update HTML files from 'chapter_list.txt'.

for chapter in `cat ../chapter_list.txt`
do
    rm "$chapter".html "$chapter"_fragment.html
    if [ "${chapter}" = "book" ]
    then
	wget -O "./$chapter.html" http://ruby.railstutorial.org/book/ruby-on-rails-tutorial\?version=4.0
    else
	wget -O "./$chapter.html" http://ruby.railstutorial.org/chapters/$chapter.html\?version=4.0
    fi
done

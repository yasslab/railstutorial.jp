#!/bin/sh

for chapter in `cat ../chapter_list.txt`
do
    for url in `ruby -ne '$_.scan(/<a href=["\x27]?(.+?)["\x27].*?>(.*?)<\/a>/){|a,b| puts a; puts b}' < $chapter.html | grep full.png | sed -e "s/railstutorial.jp/ruby.railstutorial.org/g"`
    do
	#echo $url | sed -e "s/railstutorial.jp/ruby.railstutorial.org/g" | wget -O "~/hoge/"
	wget $url -P "./tmp/"
    done
done

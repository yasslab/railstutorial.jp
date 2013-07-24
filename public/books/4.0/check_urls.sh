#!/bin/sh

LOCALHOST="http://localhost:3000"
LOG=`date "+%H_%M_%S.log"`
echo "" > $LOG
for chapter in `cat ../chapter_list.txt`
do
    for url in `ruby -ne '$_.scan(/<a href=["\x27]?(.+?)["\x27].*?>(.*?)<\/a>/){|a,b| puts a}' < $chapter.html`
    do
	if [ ${url:0:1} = "/" ]
	then
	    echo "$LOCALHOST$url"
	    wget -nv -nd --spider $LOCALHOST$url >> $LOG 2>&1
	else
	    echo $url
	    wget -nv -nd --spider $url           >> $LOG 2>&1
	fi
    done
done

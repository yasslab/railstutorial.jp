#!/bin/sh

for chapter in `cat chapter_list.txt`
do
    mv $chapter.html ../../public/books/3.2/
    echo "move archive/ja/$chapter.html \t -> ../../public/books/3.2/"
done

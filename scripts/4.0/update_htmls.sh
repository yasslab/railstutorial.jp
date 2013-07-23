#!/bin/sh

for chapter in `cat chapter_list.txt`
do
    mv $chapter.html ../../public/books/4.0/
    mv ${chapter}_fragment.html ../../public/books/4.0/
    echo "move archive/ja/$chapter[_fragment].html \t -> ../../public/books/4.0"
done

for contents in `ls *contents*`
do
    mv $contents ../../public/books/4.0/
    echo "move archive/ja/$contents \t -> ../../public/books/4.0/"
done

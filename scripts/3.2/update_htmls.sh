#!/bin/sh

for chapter in `cat chapter_list.txt`
do
    mv $chapter.html ../../public/books/3.2/
    mv ${chapter}_fragment.html ../../public/books/3.2/
    echo "move archive/ja/$chapter[_fragment].html \t -> ../../public/books/3.2/"
done

for contents in `ls *contents*`
do
    mv $contents ../../public/books/3.2/
    echo "move archive/ja/$contents \t -> ../../public/books/3.2/"
done

for books in `ls book*`
do
    mv $books ../../public/books/3.2/
    echo "move archive/ja/$books \t -> ../../public/books/3.2/"
done

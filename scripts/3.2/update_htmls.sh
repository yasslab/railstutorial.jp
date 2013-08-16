#!/bin/sh

for chapter in `cat chapter_list.txt`
do
    cp $chapter.html            ../../public/books/3.2/
    cp ${chapter}_fragment.html ../../public/books/3.2/
    echo "copy archive/ja/$chapter[_fragment].html \t -> ../../public/books/3.2/"
done

for contents in `ls *contents*`
do
    cp $contents ../../public/books/3.2/
    echo "copy archive/ja/$contents \t -> ../../public/books/3.2/"
done

cp _preface.html.erb ../../public/books/3.2/
echo "copy archive/ja/_preface.html.erb \t -> ../../public/books/3.2/"

for books in `ls book*`
do
    cp $books ../../public/books/3.2/
    echo "copy archive/ja/$books \t -> ../../public/books/3.2/"
done

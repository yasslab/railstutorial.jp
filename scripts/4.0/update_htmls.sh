#!/bin/sh

for chapter in `cat chapter_list.txt`
do
    cp $chapter.html            ../../public/books/4.0/
    cp ${chapter}_fragment.html ../../public/books/4.0/
    echo "copy archive/ja/$chapter[_fragment].html \t -> ../../public/books/4.0"
done

for contents in `ls *contents*`
do
    cp $contents ../../public/books/4.0/
    echo "copy archive/ja/$contents \t -> ../../public/books/4.0/"
done

cp _preface.html.erb ../../public/books/4.0/
echo "copy archive/ja/_preface.html.erb \t -> ../../public/books/4.0/"

for books in `ls book*`
do
    cp $books ../../public/books/4.0/
    echo "copy archive/ja/$books \t -> ../../public/books/4.0/"
done

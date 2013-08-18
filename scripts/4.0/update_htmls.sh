#!/bin/sh

for chapter in `cat chapter_list.txt`
do
    cp $chapter.html            ../../public/books/4.0/
    cp ${chapter}_fragment.html ../../public/books/4.0/
    echo "copy archive/ja/$chapter[_fragment].html \t -> ../../public/books/4.0"
done

cp _contents.html.erb      ../../public/books/4.0/
echo "copy archive/ja/_contents.html.erb \t -> ../../public/books/4.0/"
cp _contents_for_book.html.erb ../../public/books/4.0/
echo "copy archive/ja/_contents_for_book.html.erb \t -> ../../public/books/4.0/"

cp _preface.html.erb ../../public/books/4.0/
echo "copy archive/ja/_preface.html.erb \t -> ../../public/books/4.0/"

for books in `ls book*`
do
    cp $books ../../public/books/4.0/
    echo "copy archive/ja/$books \t -> ../../public/books/4.0/"
done

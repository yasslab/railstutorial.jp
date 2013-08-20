#!/bin/sh

# This is a script to locally copy published HTML files.
# So, this script can't be used by other computers

CURRENT_DIR=`pwd`
versions=( "3.2" "4.0" )

for version in "${versions[@]}"
do
    cd $CURRENT_DIR
    echo "*** Rails $version files ***"
    # copy from local files
    rm -rf   $version
    mkdir -p $version
    cd ~/railstutorial.jp/public/books/$version
    for chapter in `ls *.html | grep -v _`
    do
	echo "* Copy: $chapter\t-> $CURRENT_DIR/$version/"
	cp $chapter $CURRENT_DIR/$version/
    done
    echo ""
done

cd $CURRENT_DIR

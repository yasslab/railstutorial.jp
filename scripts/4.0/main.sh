#!/bin/sh

# 1. Unzip the given .zip file (Download from Google Translator Toolkit),
# 2. Correct their html tags with `correct_html.sh`,
# 3. Make them a single chapter that can be imported from GTT.
# 4. Replace existing html files with them.

if [ $# -eq 0 ]
then
    echo "Usage: deploy_to_4.0.sh archive.zip"
    exit
fi

# Jump to the git root directory
cd `pwd`/`git rev-parse --show-cdup`
echo "Jump to Git root directory: `pwd`"

# Unzip the translated HTML files
unzip $@
cd archive/ja
# Get files to generate HTML files
cp ../../public/books/chapter_list.txt ./
cp ../../public/books/_head.html ./
cp ../../public/books/_foot.html ./


# Jump to the git root directory
GIT_ROOT=`pwd`/`git rev-parse --show-cdup`
SCRIPT="$GIT_ROOT/scripts/4.0"
cd $GIT_ROOT
cd public/books/4.0/

# Generate chapters
#./download_3e_htmls.sh
$SCRIPT/correct_htmls.sh
$SCRIPT/truncate_all.sh
cp beginning.html sample_chapter.html   # For generating contents
$SCRIPT/create_single_chapters.sh

# Generate a table of contents and book from chapters
$SCRIPT/create_contents.sh
$SCRIPT/create_book.sh


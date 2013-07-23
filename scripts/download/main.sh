#!/bin/sh

# Download HTML files from the original 3rd Edition,
# then, correct and truncate them for Japanese Edition,
# finally, make them a single chapter that can be imported from GTT.

# Jump to the git root directory
GIT_ROOT=`pwd`/`git rev-parse --show-cdup`
SCRIPT="$GIT_ROOT/scripts/4.0"
cd $GIT_ROOT
cd public/books/4.0/

# Generate chapters
$SCRIPT/download_3e_htmls.sh
$SCRIPT/correct_htmls.sh
$SCRIPT/truncate_all.sh
cp beginning.html sample_chapter.html   # For generating contents
$SCRIPT/create_single_chapters.sh

# Generate a table of contents and book from chapters
$SCRIPT/create_contents.sh
$SCRIPT/create_book.sh


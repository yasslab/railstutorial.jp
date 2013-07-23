#!/bin/sh

# 0. Download all chapters for 4.0 from Google Translator Toolkit
# 1. Unzip the given .zip file 
# 2. Correct their html tags with `correct_html.sh`,
# 3. Make them a single chapter that can be imported from GTT.
# 4. Replace existing html files with them.

if [ $# -eq 0 ]
then
    echo "Usage: deploy_to_4.0.sh archive.zip"
    exit
fi

# Jump to the git root directory
GIT_ROOT=`pwd`/`git rev-parse --show-cdup`
SCRIPT_ROOT="$GIT_ROOT/scripts/4.0"
cd $GIT_ROOT
echo "Jump to Git root directory: $GIT_ROOT"

# Unzip the translated HTML files
unzip $@
cd archive/ja

# Get files to generate HTML files
cp $GIT_ROOT/public/books/chapter_list.txt ./
cp $GIT_ROOT/public/books/_head.html ./
cp $GIT_ROOT/public/books/_foot.html ./

# Rename each file
$SCRIPT_ROOT/correct_filenames.sh

# Generate chapters
#./download_3e_htmls.sh
#$SCRIPT_ROOT/correct_htmls.sh
$SCRIPT_ROOT/truncate_htmls.sh

# For generating contents
#cp beginning.html sample_chapter.html    # For generating contents
#$SCRIPT_ROOT/create_single_chapters.sh   # already generated

# Generate a table of contents and book from chapters
$SCRIPT_ROOT/create_contents.sh
$SCRIPT_ROOT/create_book.sh

# Move generated files to 'public/books/4.0/'
#$SCRIPT_ROOT/update_htmls.sh

# Delete all temporary files.
#cd $GIT_ROOT
#rm -rf archive
#echo "Finished updating html files."
#echo ""

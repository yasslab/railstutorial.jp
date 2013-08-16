#!/bin/sh

# 0. Download all chapters for 3.2 from Google Translator Toolkit
# 1. Unzip the given .zip file (Download from Google Translator Toolkit)
# 2. Correct their html tags with `correct_html.sh`,
# 3. Replace existing html files with them.

if [ $# -eq 0 ]
then
    echo "Usage: deploy_to_3.2.sh archive.zip"
    exit
fi

# Jump to the git root directory
GIT_ROOT=`pwd`/`git rev-parse --show-cdup`
SCRIPT_ROOT="$GIT_ROOT/scripts/3.2"
cd $GIT_ROOT
echo "Jump to Git root directory: $GIT_ROOT"

# Unzip the translated HTML files
rm -rf archive
unzip $@
cd archive/ja
# Get files to generate HTML files
cp $GIT_ROOT/public/books/3.2/chapter_list.txt ./
cp $GIT_ROOT/public/books/_head.html       ./
cp $GIT_ROOT/public/books/_foot.html       ./
cp $GIT_ROOT/public/books/BEERWARE.html    ./

# Correct and truncate for 'railstutorial.jp'
$SCRIPT_ROOT/correct_filenames.sh
$SCRIPT_ROOT/correct_htmls.sh
$SCRIPT_ROOT/truncate_htmls.sh

# Create a table of contents and book
cp supplement_corrected.html sample_chapter.html   # For generating contents
$SCRIPT_ROOT/create_contents.sh
$SCRIPT_ROOT/create_book.sh

# Move generated files to 'public/books/3.2/'
$SCRIPT_ROOT/update_htmls.sh

# Delete all temporary files.
cd $GIT_ROOT
echo "Finished updating html files."
echo ""

# Convert HTML to PDF files
#cd ./public
#./html2pdf.sh
#echo "Finished creating pdf files."
#echo ""

### Scrapped code
#cp $GIT_ROOT/scripts/3.2/rasterize.js ./
#sh $GIT_ROOT/scripts/3.2/html2pdf.sh



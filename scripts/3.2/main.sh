#!/bin/sh

# Unzip `./archive.zip` downloaded from Google Translator Toolkit,
# correct their html tags with `correct_html.sh`,
# and replace existing html files with them.

# Jump to the git root directory
cd `pwd`/`git rev-parse --show-cdup`
echo "Jump to Git root directory: `pwd`"

# Unzip the translated HTML files
unzip ./archive.zip
cd archive/ja

# Get files to generate HTML files
cp ../../public/books/chapter_list.txt ./
cp ../../public/books/_head.html ./
cp ../../public/books/_foot.html ./

# Correct and truncate for 'railstutorial.jp'
sh ../../scripts/3.2/correct_filenames.sh
sh ../../scripts/3.2/correct_htmls.sh
sh ../../scripts/3.2/truncate_htmls.sh

# Create a table of contents and book
cp beginning_corrected.html sample_chapter.html   # For generating contents
sh ../../scripts/3.2/create_contents.sh
sh ../../scripts/3.2/create_book.sh

# Move generated files to Rails public/books/3.2/
# and delete all temporary files.
sh ../../scripts/3.2/update_htmls.sh
cd ../../
rm -rf archive
echo "Finished updating html files."
echo ""

# Convert HTML to PDF files
#cd ./public
#./html2pdf.sh
#echo "Finished creating pdf files."
#echo ""

### Scrapped code
#cp ../../scripts/3.2/rasterize.js ./
#sh ../../scripts/3.2/html2pdf.sh



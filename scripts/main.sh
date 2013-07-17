#!/bin/sh

# Unzip `./archive.zip` downloaded from Google Translator Toolkit,
# correct their html tags with `correct_html.sh`,
# and replace existing html files with them.

# Unzip the translated HTML files
unzip ./archive.zip
cd archive/ja

# Get files to generate HTML files
cp ../../public/books/chapter_list.txt ./
cp ../../public/books/_head.html ./
cp ../../public/books/_foot.html ./

# Correct and truncate for 'railstutorial.jp'
sh ../../scripts/correct_filenames.sh
sh ../../scripts/correct_htmls.sh
sh ../../scripts/truncate_htmls.sh

# Create a table of contents and book
sh ../../scripts/create_contents.sh
sh ../../scripts/create_book.sh

# Move generated files to Rails public/books/3.2/
# and delete all temporary files.
sh ../../scripts/update_htmls.sh
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
#cp ../../scripts/rasterize.js ./
#sh ../../scripts/html2pdf.sh



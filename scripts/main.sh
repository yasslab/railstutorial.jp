#!/bin/sh

# Unzip `./archive.zip` downloaded from Google Translator Toolkit,
# correct their html tags with `correct_html.sh`,
# and replace existing html files with them.

unzip ./archive.zip
cd archive/ja
sh ../../scripts/correct_filenames.sh
sh ../../scripts/correct_htmls.sh
sh ../../scripts/truncate_htmls.sh
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


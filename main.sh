#!/bin/sh

# Unzip `./archive.zip` downloaded from Google Translator Toolkit,
# correct their html tags with `correct_html.sh`,
# and replace existing html files with them.

unzip ./archive.zip
cd archive/ja
sh ../../correct_filenames.sh
sh ../../correct_htmls.sh
sh ../../update_htmls.sh
cd ../../
rm -rf archive
echo "Finished updating html files."




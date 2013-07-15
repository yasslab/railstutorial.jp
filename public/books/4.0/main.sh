#!/bin/sh

# Download HTML files from the original 3rd Edition,
# then, correct and truncate them for Japanese Edition,
# finally, make them a single chapter that can be imported from GTT.

# For chapters
./download_3e_htmls.sh
./correct_htmls.sh
./truncate_all.sh
./create_contents.sh
./create_single_chapters.sh

# For book (generated from chapters)
./create_book.sh


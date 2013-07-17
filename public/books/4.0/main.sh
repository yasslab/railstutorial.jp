#!/bin/sh

# Download HTML files from the original 3rd Edition,
# then, correct and truncate them for Japanese Edition,
# finally, make them a single chapter that can be imported from GTT.

# Generate chapters
./download_3e_htmls.sh
./correct_htmls.sh
./truncate_all.sh
cp beginning.html sample_chapter.html   # For generating contents
./create_single_chapters.sh

# Generate a table of contents and book from chapters
./create_contents.sh
./create_book.sh


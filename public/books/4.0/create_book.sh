#!/bin/sh

# Combine header, footer, and chapters,
# make anchor tags point to inside ones,
# and create a book named 'book.html'.

echo "" >  book_fragment.html
for chapter in `cat ../chapter_list.txt`
do
    cat "$chapter"_fragment.html >> book_fragment.html
done
echo "Created 'book_fragment.html'"

# Make anchor tags point to the corresponding ones inside a book.
cp  book_fragment.html book_fragment.modified.html
cat book_fragment.modified.html | \
    ruby -n -e 'puts $_.gsub(/(href=\")(?!http:\/\/)(.+?)([?|#])/, "\\1\\4")' \
    > book_fragment.html
rm  book_fragment.modified.html
echo "Corrected 'book_fragment.html'"

# Create a 'book.html'
cat ../_head.html      >  book.html
cat book_fragment.html >> book.html
cat ../_foot.html      >> book.html
echo "Created 'book.html'"    
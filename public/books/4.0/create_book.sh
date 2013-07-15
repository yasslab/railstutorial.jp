#!/bin/sh

# Combine header, footer, and chapters,
# then create a book named 'book.html'.

cat ../_head.html                   >  book.html
echo ""                             >  book_fragment.html
for chapter in `cat ../chapter_list.txt`
do
    cat "$chapter"_fragment.html    >> book.html
    cat "$chapter"_fragment.html    >> book_fragment.html
done
cat ../_foot.html                   >> book.html
echo "Created 'book.html' and 'book_fragment.html'"

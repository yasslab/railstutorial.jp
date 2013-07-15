#!/bin/sh

# Combine header, footer, and chapters,
# make anchor tags point to inside ones,
# and create a book named 'book.html'.

echo "" >  book_fragment.html
for chapter in `cat ../chapter_list.txt`
do
    # echo "s/$chapter#top/#cha-$chapter/g"
    cat "$chapter"_fragment.html | \
	sed -e "s/id=\"top\"/class=\"label\" id=\"cha-$chapter\"/g" | \
	perl -pe "s/<\/div><div class=\"footnotes\">/<\/div>\n<div class=\"footnotes\">/g" | \
	sed -n '/<div class="navigation">/,/^<\/div>/!p' \
	>> book_fragment.html.modified_0
done
echo "Created 'book_fragment.html'"


# Make anchor tags point to the corresponding ones inside a book.
i=0
for chapter in `cat ../chapter_list.txt`
do
    cat book_fragment.html.modified_$i | \
	sed -e "s/\/chapters\/$chapter.html#top/#cha-$chapter/g" | \
	sed -e "s/\/chapters\/$chapter.html//g" \
	> book_fragment.html.modified_`expr $i + 1`
    rm  book_fragment.html.modified_$i
    i=`expr $i + 1`
done
mv book_fragment.html.modified_$i book_fragment.html
echo "Corrected 'book_fragment.html'"

# Create a 'book.html'
cat ../_head.html      >  book.html
cat book_fragment.html >> book.html
cat ../_foot.html      >> book.html
echo "Created 'book.html'"    

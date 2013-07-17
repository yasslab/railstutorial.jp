#!/bin/sh

# Truncate Title, Table of Contents, and Main Content,
# then create '_contents.html.erb',
# and create '_contents_for_book.html.erb'
# that all links point to inside tags.

# Create '_contents.html.erb',
echo '<h1 class="title">Ruby on Rails 3.2 チュートリアル </h1>' > _contents.html.erb
cat beginning.html | \
    sed -n '/<h1 class="subtitle">/, /<\/pre><\/div>/p' \
    >> _contents.html.erb
echo "</div>" >> _contents.html.erb
echo "Created '_contents.html.erb"

# Make single page for the main contents that include table, foreword, etc.
cat _head.html           >  contents.html
cat _contents.html.erb   >> contents.html
cat _foot.html           >> contents.html
echo "Created 'contents.html'"

# Create '_contents_for_book.html.erb'
# that all links point to inside tags.
for chapter in `cat chapter_list.txt`
do
    #echo "s/$chapter#top/#cha-$chapter/g"
    cat _contents.html.erb | \
	sed -e "s/id=\"top\"/class=\"label\" id=\"cha-$chapter\"/g" | \
	perl -pe "s/<\/div><div class=\"footnotes\">/<\/div>\n<div class=\"footnotes\">/g" | \
	sed -n '/<div class="navigation">/,/^<\/div>/!p' \
	> _contents_for_book.html.erb.modified_0
done

# Make anchor tags point to the corresponding ones inside a book.
i=0
for chapter in `cat chapter_list.txt`
do
    cat _contents_for_book.html.erb.modified_$i | \
	sed -e "s/\/chapters\/$chapter.html#top/#cha-$chapter/g" | \
	sed -e "s/\/chapters\/$chapter.html//g" \
	> _contents_for_book.html.erb.modified_`expr $i + 1`
    rm  _contents_for_book.html.erb.modified_$i
    i=`expr $i + 1`
done
mv _contents_for_book.html.erb.modified_$i _contents_for_book.html.erb
echo "Created '_contents_for_book.html.erb'"

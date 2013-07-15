#!/bin/sh

# Truncate Title, Table of Contents, and Main Content,
# then create '_contents.html.erb',
# and create '_contents_for_book.html.erb'
# that all links point to inside tags.


# Create '_contents.html.erb',
echo '<h1 class="title">Ruby on Rails 4.0 Tutorial </h1>' > _contents.html.erb
cat beginning.html.original | \
    sed -n '/<h1 class="subtitle">/, /<\/pre><\/div>/p' \
    >> _contents.html.erb
echo "</div>" >> _contents.html.erb
echo "Created '_contents.html.erb"

# Create '_contents_for_book.html.erb'
# that all links point to inside tags.
VERSION="?version=4.0"
#VERSION=""
for chapter in `cat ../chapter_list.txt`
do
    #echo "s/$chapter$VERSION#top/$VERSION#cha-$chapter/g"
    cat _contents.html.erb | \
	sed -e "s/id=\"top\"/class=\"label\" id=\"cha-$chapter\"/g" | \
	perl -pe "s/<\/div><div class=\"footnotes\">/<\/div>\n<div class=\"footnotes\">/g" | \
	sed -n '/<div class="navigation">/,/^<\/div>/!p' \
	> _contents_for_book.html.erb.modified_0
done

# Make anchor tags point to the corresponding ones inside a book.
i=0
for chapter in `cat ../chapter_list.txt`
do
    cat _contents_for_book.html.erb.modified_$i | \
	sed -e "s/$chapter$VERSION#top/$VERSION#cha-$chapter/g" | \
	sed -e "s/$chapter$VERSION/$VERSION/g" \
	> _contents_for_book.html.erb.modified_`expr $i + 1`
    rm  _contents_for_book.html.erb.modified_$i
    i=`expr $i + 1`
done
mv _contents_for_book.html.erb.modified_$i _contents_for_book.html.erb
echo "Created '_contents_for_book.html.erb'"

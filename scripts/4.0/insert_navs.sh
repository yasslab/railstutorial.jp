#!/bin/sh

# Insert navigations to wherever you want to add.
# TODO: Refactor shared behavior as a function

## Add a navigation for index to chapter 1
FILENAME="beginning.html.original"
FN=`grep -n -w 'footnotes' $FILENAME | cut -d ':' -f1`
NEXT_FN=`expr $FN - 1`

#cat $FILENAME | tail -n +$INSERT
FIRST_HALF=` cat $FILENAME | head -n $NEXT_FN`
SECOND_HALF=`cat $FILENAME | tail -n +$FN`

NEXT_NAV='
<a class="prev_page" href="/?version=4.0"></a>
<a class="prev_page" href="/?version=4.0">
  <span class="number">トップページ</span></a>
<a class="prev_page" href="/?version=4.0">  </a>
'

echo "$FIRST_HALF
$NEXT_NAV
$SECOND_HALF" > $FILENAME

## Add a navigation for chapter 12 to chapter 11
#FILENAME="following-users.html.original"
#FN=`grep -n -w 'footnotes' $FILENAME | cut -d ':' -f1`
#NEXT_FN=`expr $FN - 1`
#
##cat $FILENAME | tail -n +$INSERT
#FIRST_HALF=` cat $FILENAME | head -n $NEXT_FN`
#SECOND_HALF=`cat $FILENAME | tail -n +$FN`
#
#NEXT_NAV='
#<a class="next_page" href="/chapters/supplement.html#top"></a>
#<a class="next_page" href="/chapters/supplement.html#top">
#  <span class="number">第12章</span>Rails 3.2 と Rails 4.0 の違い</a>
#<a class="next_page" href="/chapters/supplement.html#top">  </a>
#'
#
#echo "$FIRST_HALF
#$NEXT_NAV
#$SECOND_HALF" > $FILENAME

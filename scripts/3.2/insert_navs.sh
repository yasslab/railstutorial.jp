#!/bin/sh

FILENAME="following-users.html.original"
FN=`grep -n -w 'footnotes' $FILENAME | cut -d ':' -f1`
NEXT_FN=`expr $FN - 1`

#cat $FILENAME | tail -n +$INSERT
FIRST_HALF=` cat $FILENAME | head -n $NEXT_FN`
SECOND_HALF=`cat $FILENAME | tail -n +$FN`

NEXT_NAV='
<a class="next_page" href="/chapters/supplement.html#top"></a>
<a class="next_page" href="/chapters/supplement.html#top">
  <span class="number">第12章</span>Rails 3.2 と Rails 4.0 の違い</a>
<a class="next_page" href="/chapters/supplement.html#top">  </a>
'

echo "$FIRST_HALF
$NEXT_NAV
$SECOND_HALF" > $FILENAME



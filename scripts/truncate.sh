#!/bin/sh

if [ $# -eq 0 ]
then
    echo "Usage: ./truncate.sh FILENAME"
else
    #Start=99
    Start=`grep -n -w 'id="top"' $@ | cut -d ':' -f1`
    Line=`cat $@ | awk 'END {print NR }'`
    End=`expr $Line - 3`
    cat $@ | head -n $End | tail -n +$Start
fi

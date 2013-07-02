#!/bin/sh

if [ $# -eq 0 ]
then
    echo "Usage: ./truncate.sh FILENAME"
else
    Line=`grep '' $@ -c`
    Start=99
    End=`expr $Line - 3`
    cat $@ | head -n $End | tail -n +$Start
fi

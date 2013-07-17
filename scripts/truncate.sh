#!/bin/sh

if [ $# -eq 0 ]
then
    echo "Usage: ./truncate.sh FILENAME"
else
    #Start=99
    Start=`grep -n -w 'id="top"' $@ | cut -d ':' -f1`
    End=`  grep -n -w '</body>' $@ | cut -d ':' -f1`
    End=`expr $End - 2`
    cat $@ | head -n $End | tail -n +$Start
fi

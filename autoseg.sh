#!/bin/bash

#FILENAME is your cheatcode file name
#e.g. FILENAME=16F4915DF864674D.txt
FILENAME=
cat $FILENAME | sed -e 's/\r$//' | grep -v '^$' > cheatcode.txt

while read line || [[ -n $line ]]
do

CHEATNAME=$(echo $line | awk -F'[][]' '{print $2}')
if [[ ! -z "$CHEATNAME" ]];then
    CNAME=$CHEATNAME
    mkdir -p "$CNAME/cheats"    
    touch "$CNAME/cheats/$FILENAME"
    echo $line >> "$CNAME/cheats/$FILENAME"
else
    echo $line >> "$CNAME/cheats/$FILENAME"
fi

done < cheatcode.txt
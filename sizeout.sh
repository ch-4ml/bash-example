#!/bin/bash

if [ $# -ne 1 ]; then
    echo "#usage: bash $0 <file>"
    exit
fi

FILE=$1
set $(wc -c "$FILE")
FILESIZE=$1
echo "file size:" $FILESIZE

if [ $FILESIZE -le 1000 ]; then
    echo "File size is less than 1000 bytes."
else
    echo "File size is more than 1000 bytes."
fi
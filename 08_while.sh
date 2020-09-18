#!/bin/bash

# solution=0
# i=1
# while [ $i -le 10 ]
# do
#     solution=`expr $solution + $i`
#     i=`expr $i + 1`
# done
# echo "The total is as follows:" $solution

# i=1
# files=""
# for file in $*
# do
#     if [ file == $# ]; then
#         break
#     fi
#     echo $@
# done

i=1
while [ $i -le `expr $# - 1` ]
do
    echo $* | cut -f $i -d ' '
    
    i=`expr $i + 1`
done
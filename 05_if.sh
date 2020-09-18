#!/bin/sh

echo -e "File name is \033[1;31m<"$0">\033[0m."
echo -e "The first parameter is \033[1;32m<"$1">\033[0m."
echo -e "The second parameter is \033[1;33m<"$2">\033[0m."
echo -e "The third parameter is \033[1;34m<"$3">\033[0m."

if [ "$1" == "1" ]
then
    echo -e "\033[1;45;32mthis is the first bifurcation. \033[0m"
elif [ "$1" == "2" ]
then
    echo -e "\033[1;45;32mthis is the second bifurcation. \033[0m"
else
    echo -e "\033[1;45;32mthis is the rest bifurcation. \033[0m"
fi

if [ -f $2 ] && [ x$2 != x ]
then
    cat $2
else
    echo "the file doesn't exist!"
fi
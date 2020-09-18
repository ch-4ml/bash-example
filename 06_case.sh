#!/bin/sh

echo -e "The first parameter is \033[1;32m<"$1">\033[0m."
echo -e "The second parameter is \033[1;33m<"$2">\033[0m."

case "$1" in
    start)
        echo "Start";;
    end)
        echo "Stop";;
    restart)
        echo "Restart";;
    *)
        echo "Unknown";;
esac

echo "Would you like to challenge? (Yes/No)";
read answer

case "$answer" in
    yes|y|Y|Yes|YES)
        echo "Yes";;
    [nN]*)
        echo "No";;
    *)
        echo "Unknown";;
esac
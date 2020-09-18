# for file in $*
# do
#     if [ ! -e $file ]; then
#         echo "$file ok"
#     else
#         echo "$file x"
#         exit 1
#     fi
# done

# i=1
# for file in $*
# do
#     val=1
#     i=`expr $i + 1`
# done
# echo $val
# echo $i

Test() {
    read params
    return 1
}

Test
echo "dd"
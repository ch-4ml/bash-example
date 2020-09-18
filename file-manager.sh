#!/bin/bash


Manager() {
    while [ true ]
        do
        echo -e "\033[1;33m□□□□□□□□□□□□□□□□□ M E N U □□□□□□□□□□□□□□□□□\033[0m"
        echo -e "\033[1;33m□\033[0m 1. Remove File                          \033[1;33m□\033[0m"
        echo -e "\033[1;33m□\033[0m 2. Move File                            \033[1;33m□\033[0m"
        echo -e "\033[1;33m□\033[0m 3. Remove Directory                     \033[1;33m□\033[0m"
        echo -e "\033[1;33m□\033[0m 4. Move Directory                       \033[1;33m□\033[0m"
        echo -e "\033[1;33m□\033[0m 5. Print out the contents of the file   \033[1;33m□\033[0m"
        echo -e "\033[1;33m□\033[0m 6. Show List                            \033[1;33m□\033[0m"
        echo -e "\033[1;33m□\033[0m 7. Exit                                 \033[1;33m□\033[0m"
        echo -e "\033[1;33m□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□\033[0m"
        echo
        read -p "Choose menu: " menu
        Run $menu
    done
}

Run() {
    if [ $# -ne 1 ]; then
        echo -e "\033[1;31merror: 1 parameter expected. <integer(1 ~ 7)>\033[0m"
        return 1
    fi
    case "$1" in
        1)
            echo -e "\033[1;32mRemove File\033[0m"
            read -p "Input params: " params
            RemoveFile $params;;
        2)
            echo -e "\033[1;32mMove File\033[0m"
            read -p "Input params: " params
            MoveFile $params;;
        3)
            echo -e "\033[1;32mRemove Directory\033[0m"
            read -p "Input params: " params
            RemoveDir $params;;
        4)
            echo -e "\033[1;32mMove Directory\033[0m"
            read -p "Input params: " params
            MoveDir $params;;
        5)
            echo -e "\033[1;32mPrint out the contents of the file\033[0m"
            read -p "Input params: " params
            Print $params;;
        6)
            echo -e "\033[1;32mShow List\033[0m"
            read -p "Input param: " params
            List $params;;
        7)
            echo -e "\033[1;32mExit\033[0m"
            Exit;;
        *)
            echo -e "\033[1;31merror: Choose the right menu(1 ~ 7).\033[0m";;
    esac
    echo
}

RemoveFile() {
    if [ $# -lt 1 ]; then
        echo -e "\033[1;31merror: At least 1 parameter expected. <file1> [<file2> <file3> ...]\033[0m"
    else
        for file in $*
        do
            if [ ! -e $file ]; then
                echo -e "\033[1;31merror: File not found: $file\033[0m"
                return 1
            elif [ -d $file ]; then
                echo -e "\033[1;31merror: $file is a directory.\033[0m"
            fi
        done
        rm $*
        echo -e "\033[1;32mRemoved file(s).\033[0m"
    fi
}

MoveFile() {
    if [ $# -lt 2 ]; then
        echo -e "\033[1;31merror: At least 2 parameters expected. <file> [<file2> <file3> ...] <destination>\033[0m"
    else
        i=1
        for file in $*
        do
            if [ $# -eq $i ]; then
                dest=$file
                break
            elif [ ! -f $file ]; then
                echo -e "\033[1;31merror: $file is not a file.\033[0m"
                return 1
            fi
            i=`expr $i + 1`
        done
        if [ ! -d $dest ]; then
            echo -e "\033[1;31merror: Destination directory not found: $dest\033[0m"
            return 1
        fi
        mv $*
        echo -e "\033[1;32mMoved file(s).\033[0m"
    fi
}

RemoveDir() {
    if [ $# -lt 1 ]; then
        echo -e "\033[1;31merror: At least 1 parameter expected. <dir1> [<dir2> <dir3> ...]\033[0m"
    else
        for dir in $*
        do
            if [ ! -d $dir ]; then
                echo -e "\033[1;31merror: $dir is not a directory.\033[0m"
                return 1
            fi
        done
        rm -r $*
        echo "Removed directory(s)."
    fi
}

MoveDir() {
    if [ $# -lt 2 ]; then
        echo -e "\033[1;31merror: At least 2 parameters expected. <dir> [<dir2> <dir3> ...] <destination>\033[0m"
    else
        for dir in $*
        do
            if [ ! -d $dir ]; then
                echo -e "\033[1;31merror: $dir is not a directory.\033[0m"
                return 1
            fi
        done
        mv $*
        echo "Moved directory(s)."
    fi
}

Print() {
    if [ $# -lt 1 ]; then
        echo -e "\033[1;31merror: At least 1 parameter expected. <file1> [<file2> <file3> ...]\033[0m"
    else
        for file in $*
        do
            if [ ! -f $file ]; then
                echo -e "\033[1;31merror: $file is not a file.\033[0m"
                return 1
            fi
        done
        more $*
    fi
}

List() {
    if [ $# -ne 1 ]; then
        echo -e "\033[1;31merror: 1 parameter expected. <dir>\033[0m"
    elif [ ! -d $1 ]; then
        echo -e "\033[1;31merror: $1 is not a directory.\033[0m"
        return 1
    else
        ls -laF $1
    fi
}

Exit() {
    echo "Bye."
    exit 1
}

Manager
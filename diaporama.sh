
IFS=$'\n'
R=""
P="ALPHA"
D=180

#TESTS
if [ $# -lt 1 ]; then
    echo "diaporama.sh [-repertoire R] [-politique P] [-delai D]"
    exit 1
else 
    if [ $# -gt 1 ]; then
        if [ $1 -d ];then
            $R=$1
        fi
    else 
        echo "The folder doesnt exist"
        exit 2
    fi

    if [ $# -gt 2 ]; then
        if [ $2 -eq "ALPHA" ];then
            echo "Default politic is already ALPHA"
        elif [ $2 -eq "RANDOM" ];then
            $P="RANDOM"
        else 
            echo "Politic is either ALPHA or RANDOM"
            exit 3
        fi
    fi

    if [ $# -gt 3 ]; then
        if [ $3 =~ '^[0-9]+$' -a $3 -gt 0 ]; then
            $D=$3
        else 
            echo "Your delay has to be a positive number"
            exit 4
        fi
    fi
fi

#SCRIPT
if [ $P -eq "ALPHA" ]; then
    for i in `ls -1 $R`
        do
            echo $i
            xv $R/$i
            sleep $D
    done
else 
    list=`ls -1 $R`
    size=${#$list[@]}
    echo $size
    while [ true ]
        do
        $randomNumber=$(($RANDOM%$size))
        echo "${list[$randomNumber]}"
        xv $R/$i
        sleep $D
    done
fi

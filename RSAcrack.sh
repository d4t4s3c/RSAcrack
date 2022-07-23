#!/bin/bash

declare -r RED="\e[91m"
declare -r GREEN="\e[92m"
declare -r YELLOW="\e[93m"
declare -r BLUE="\e[94m"
declare -r WHITE="\e[97m"
declare -r END="\e[0m"

declare -r VAR1='['
declare -r VAR2=']'
declare -r VAR3='i'
declare -r VAR4='*'
declare -r VAR5='>'
declare -r VAR6='<'
declare -r VAR7='-'
declare -r VAR8='+'
declare -r VAR9='RSAcrack'
declare -r VAR10='WORDLIST'
declare -r VAR11='KEY'
declare -r VAR12='Use:'
declare -r VAR13='Cracking:'
declare -r VAR14='Wordlist:'
declare -r VAR15='Password:'
declare -r VAR16='Line:'
declare -r VAR17='Error!'
declare -r VAR18='Fuck!'
declare -r VAR19='it was not possible to crack his key.'
declare -r VAR20='ssh-keygen not installed.'
declare -r VAR21='Status:'
declare -r VAR22='-=========================-'

declare -r BOX1="$WHITE$VAR1$GREEN$VAR8$WHITE$VAR2$END"
declare -r BOX2="$WHITE$VAR1$RED$VAR7$WHITE$VAR2$END"
declare -r BOX3="$WHITE$VAR1$YELLOW$VAR3$WHITE$VAR2$END"
declare -r BOX4="$WHITE$VAR1$BLUE$VAR4$WHITE$VAR2$END"

trap ctrl_c INT

function check(){
                which ssh-keygen > /dev/null 2>&1
        if [ "$(echo $?)" == "0" ]; then
                :
        else
                echo ""
                echo -e "$BOX2 $RED$VAR17 $WHITE$VAR20$END"
                echo ""
                sleep 2
                return
        fi
}

function banner(){
        echo -e "$GREEN"
        echo -e "╭━━━┳━━━┳━━━╮          ╭╮"
        echo -e "┃╭━╮┃╭━╮┃╭━╮┃          ┃┃"
        echo -e "┃╰━╯┃╰━━┫┃ ┃┣━━┳━┳━━┳━━┫┃╭╮"
        echo -e "┃╭╮╭┻━━╮┃╰━╯┃╭━┫╭┫╭╮┃╭━┫╰╯╯"
        echo -e "┃┃┃╰┫╰━╯┃╭━╮┃╰━┫┃┃╭╮┃╰━┫╭╮╮"
        echo -e "╰╯╰━┻━━━┻╯ ╰┻━━┻╯╰╯╰┻━━┻╯╰╯$END"
        echo -e "$WHITE$VAR22$END"
}

function main(){
        echo ""
        echo -e "$BOX3 $RED$VAR12 $WHITE$VAR9 -w $RED$VAR6$WHITE$VAR10$RED$VAR5$WHITE -k $RED$VAR6$WHITE$VAR11$RED$VAR5$END"
        echo ""
}

function info(){
        echo -e "$BOX4 $WHITE$VAR13 $BLUE$KEY$END"
        sleep 1
        echo -e "$BOX4 $WHITE$VAR14 $BLUE$WORDLIST$END"
        sleep 1
        echo -e "$BOX3 $WHITE$VAR21$END"
        sleep 1
}

function ctrl_c(){
        echo ""
        exit 1
}

while getopts ":k:w:h:" arg; do
        case $arg in
                k) KEY=$OPTARG; let parameter_counter+=1 ;;
                w) WORDLIST=$OPTARG; let parameter_counter+=1 ;;
                h) help;;
        esac
done

if [ ! -z $WORDLIST ]; then
        check
        banner
        sleep 0.5
else
        check
        banner
        main
        exit 0
fi

if [ ! -z $KEY ]; then
        /usr/bin/chmod 600 $KEY &>/dev/null
        info
else
        main
        exit 0
fi

lines=$(/usr/bin/wc -l $WORDLIST)
regex="([0-9]+).$WORDLIST"
[[ $lines =~ $regex ]]
siz="${BASH_REMATCH[1]}"

while read PASSWORD; do
                line=$((line + 1))
                progress=$((line * 100 / siz))
                echo -ne "\r$YELLOW    $line/$siz/$progress%/$PASSWORD                              $END"
                /usr/bin/ssh-keygen -y -f $KEY -P $PASSWORD &>/dev/null
        if [ $? -eq 0 ]; then
                F1=$(/usr/bin/cat $WORDLIST | /usr/bin/grep "^$PASSWORD$" -n | /usr/bin/cut -d ":" -f 1)
                echo -e "\n$BOX1 $RED$VAR15 $GREEN$PASSWORD$RED $VAR16 $GREEN$F1$END"
                echo ""
                sleep 2
                exit 0
        fi
done < $WORDLIST
echo -e "\r$BOX2 $RED$VAR18 $WHITE$VAR19$END"
echo ""
sleep 2
exit 0

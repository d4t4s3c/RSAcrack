#!/bin/bash

declare -r White="\e[97m"
declare -r Red="\e[31m"
declare -r BlueLight="\e[94m"
declare -r GreenLight="\e[92m"
declare -r YellowLight="\e[93m"
declare -r CyanLight="\e[96m"
declare -r End="\e[0m"

declare -r var1='['
declare -r var2=']'
declare -r var3='i'
declare -r var4='x'
declare -r var5='>'
declare -r var6='<'
declare -r var7='-'
declare -r var8='+'
declare -r var9='RSAcrack'
declare -r var10='WORDLIST'
declare -r var11='KEY'
declare -r var12='Example:'
declare -r var13='Cracking:'
declare -r var14='WordList:'
declare -r var15='Password:'
declare -r var16='Line:'
declare -r var17='Error!'
declare -r var18='Fuck!'
declare -r var19='it was not possible to crack his key'
declare -r var20='SSH-Keygen not installed'
declare -r var21='Status:'
declare -r var22='========================================'
declare -r var23='[+]'
declare -r var24='[-]'
declare -r var25='[!]'
declare -r var26='[*]'

function check(){
                which ssh-keygen > /dev/null 2>&1
        if [ "$(echo $?)" == "0" ]; then
                :
        else
                echo ""
                echo -e "$Red$var24 $Red$var17 $White$var20$End"
                sleep 2
                exit 1
        fi
}

function banner(){
        echo ""
        echo -e "$Red$var1$White$var22$Red$var2$End"
        echo -e "$GreenLight         ██████╗ ███████╗ █████╗$End"
        echo -e "$GreenLight         ██╔══██╗██╔════╝██╔══██╗$End"
        echo -e "$GreenLight         ██████╔╝███████╗███████║$End"
        echo -e "$GreenLight         ██╔══██╗╚════██║██╔══██║$End"
        echo -e "$GreenLight         ██║  ██║███████║██║  ██║$End"
        echo -e "$GreenLight         ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝$End"
        echo -e "$GreenLight  ██████╗██████╗  █████╗  ██████╗██╗  ██╗$End"
        echo -e "$GreenLight ██╔════╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝$End"
        echo -e "$GreenLight ██║     ██████╔╝███████║██║     █████╔╝$End"
        echo -e "$GreenLight ██║     ██╔══██╗██╔══██║██║     ██╔═██╗$End"
        echo -e "$GreenLight ╚██████╗██║  ██║██║  ██║╚██████╗██║  ██╗$End"
        echo -e "$GreenLight  ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝$End"
        echo -e "$Red$var1$White$var22$Red$var2$End"
}

function main(){
        echo ""
        echo -e "$YellowLight$var25 $Red$var12 $White$var9 -w $Red$var6$White$var10$Red$var5$White -k $Red$var6$White$var11$Red$var5$End"
        echo ""
}

function info(){
        echo ""
        echo -e "$BlueLight$var26 $White$var13 $CyanLight$key$End"
        sleep 1
        echo -e "$BlueLight$var26 $White$var14 $CyanLight$wordlist$End"
        sleep 1
        echo -e "$YellowLight$var25 $White$var21$End"
        sleep 1
}

while getopts ":k:w:h:" arg; do
    case $arg in
        k) key=$OPTARG; let parameter_counter+=1 ;;
	w) wordlist=$OPTARG; let parameter_counter+=1 ;;
	h) help;;
    esac
done

if [ ! -z $wordlist ]; then
        check
        banner
        sleep 0.5
else
        check
        banner
        main
        exit 0
fi

if [ ! -z $key ]; then
        /usr/bin/chmod 600 $key &>/dev/null
        info
else
        main
        exit 0
fi

lines=$(/usr/bin/wc -l $wordlist)
regex="([0-9]+).$wordlist"
[[ $lines =~ $regex ]]
siz="${BASH_REMATCH[1]}"

while read password; do
                line=$((line + 1))
                progress=$((line * 100 / siz))
                echo -ne "\r$YellowLight    $line/$siz ($progress%) ($password)          $End"
                /usr/bin/ssh-keygen -y -f $key -P $password &>/dev/null
        if [ $? -eq 0 ]; then
                f1=$(/usr/bin/cat $wordlist | /usr/bin/grep "^$password$" -n | /usr/bin/cut -d: -f1)
                echo -e "\n$GreenLight$var23 $Red$var15 $GreenLight$password$Red $var16 $GreenLight$f1"
                echo ""
                sleep 2
                exit 0
        fi
done < $wordlist
echo -e "\r$Red$var24 $Red$var18 $White$var19$End"
echo ""
sleep 2
exit 0

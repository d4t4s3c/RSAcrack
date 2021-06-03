#!/bin/bash

#Author:  d4t4s3c
#Twitter: @d4t4s3c
#Email:   d4t4s3c@protonmail.com
#GitHub:  www.github.com/d4t4s3c

#colors
declare -r White="\e[97m"
declare -r Red="\e[31m"
declare -r GreenLight="\e[92m"
declare -r YellowLight="\e[93m"
declare -r CyanLight="\e[96m"
declare -r End="\e[0m"

#var
declare -r cu1='[+]'
declare -r cu2='[*]'
declare -r cu3='[i]'
declare -r cu4='[x]'
declare -r v1='x'
declare -r v2='Error SSH-Keygen not installed'
declare -r v3='Fuck!'
declare -r v4='it was not possible to crack his key'
declare -r v5='i'
declare -r wordlist="$1"
declare -r key="$2"

function check(){
        which ssh-keygen > /dev/null 2>&1
    if [ "$(echo $?)" == "0" ]; then
        echo ""
    else
        echo ""
        echo -e "$GreenLight[$Red$v1$GreenLight] $Red$v2$End"
        sleep 2
        exit 1
    fi
}

function banner(){
echo -e "$GreenLight        ██████╗ ███████╗ █████╗         $End";
echo -e "$GreenLight        ██╔══██╗██╔════╝██╔══██╗        $End";
echo -e "$GreenLight        ██████╔╝███████╗███████║        $End";
echo -e "$GreenLight        ██╔══██╗╚════██║██╔══██║        $End";
echo -e "$GreenLight        ██║  ██║███████║██║  ██║        $End";
echo -e "$GreenLight        ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝        $End";
echo -e "$GreenLight ██████╗██████╗  █████╗  ██████╗██╗  ██╗$End";
echo -e "$GreenLight██╔════╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝$End";
echo -e "$GreenLight██║     ██████╔╝███████║██║     █████╔╝ $End";
echo -e "$GreenLight██║     ██╔══██╗██╔══██║██║     ██╔═██╗ $End";
echo -e "$GreenLight╚██████╗██║  ██║██║  ██║╚██████╗██║  ██╗$End";
echo -e "$GreenLight ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝$End";
}

function main(){
    echo -e "$GreenLight[$YellowLight$v5$GreenLight]$White Usage:    $YellowLight./RSAcrack.sh rockyou.txt id_rsa$End"
}

check
banner
main

if [ ! -z $wordlist ]; then
    sleep 1
else
    exit 0
fi

if [ ! -z $key ]; then
    chmod 600 $key &>/dev/null
    sleep 1
else 
    exit 0
fi

while read password; do
    ssh-keygen -y -f $key -P $password &>/dev/null
        if [ $? -eq 0 ]; then
            echo -e "$GreenLight[$CyanLight*$GreenLight]$White Craking:$CyanLight  $key"
            sleep 2
            echo -e "$GreenLight[$CyanLight*$GreenLight]$White Wordlist:$CyanLight $wordlist"
            sleep 2
            echo -e "$GreenLight[$Red+$GreenLight]$Red Password:$GreenLight $password"
            sleep 4
            exit 0
        fi
done < $1
echo -e "$GreenLight[$Red$v1$GreenLight]$Red $v3 $White$v4$End"

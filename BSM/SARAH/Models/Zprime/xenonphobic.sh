#!/usr/bin/env bash
#bash runmicromegas.sh && echo SPheno && read && bash runSpheno.sh
if [ ! "$1" ];then
    echo "Usage: $0 N[\\\\/M]"
    exit
fi
d=$1
if [ "$(echo $d | grep '/')" ]; then
    if [ ! "$(echo $d | grep '\\/')" ]; then
	echo "ERROR! use \\\\/ for /"
	exit
    fi
fi
sed -i 's/^\s*dRInput\s*\=\s*.*;/dRInput = '$d';/' SARAH/Models/Zprime/config.m

m=1
if [ "$2" ];then
    m=$2
fi

sed -i 's/^\s*m\s*\=\s*.*;/m = '$m';/' SARAH/Models/Zprime/config.m
echo $m
read -p "Press [Enter] key to continue..."

echo "Compiling the model for dRInput=$d and m=$m"
bash diffkkk.sh
grep -B1 -A1 "{Xq,Xl" kkk
echo micromegas
#read
rm -f micromegas/Zprime/CalcOmega_with_DDetection_MOv5
bash runmicromegas.sh 
echo SPheno 
#read
rm -f SPheno/bin/SPhenoZprime
bash runSpheno.sh
#TODO: Rescale gp to get the correct relic density
OutDir=ZprimeOutSmall
mkdir -p $OutDir
df=.$(echo $d | sed 's/\\\//_/')
./SPheno/bin/SPhenoZprime LesHouches.in.Zprime
./micromegas/Zprime/CalcOmega_with_DDetection_MOv5 SPheno.spc.Zprime > $OutDir/micromegas$df.out
mv SPheno.spc.Zprime $OutDir/SPheno.spc.Zprime$df
#cat micromegas.54_43.out | grep -A1000  ^Xf |  grep -E "^\s*\w" | grep -Ev '^\s*[0-9]' | grep -B1000 -A2 "cross sections"

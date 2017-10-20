#!/usr/bin/env bash
if [ "$1" ];then
    MODEL=$1
else
    echo "USAGE $0 MODEL[DIR/MODEL]"
    exit
fi     
if [ $MODEL != SM ] ;then
    MODELp=$( echo $MODEL | sed s'/\//+/g')
    cd ../SARAH
    git checkout master
    git checkout $MODELp
    git branch
    echo $MODEL
    cd -
fi    
echo "Compile SARAH on $MODEL?"
read sarah

math << EOI || die
      <<"SARAH/SARAH.m"
      Start["$MODEL"];
      MakeSPheno[];
EOI

echo "Compile SPHENO?"
read spheno

if [ "$2" ];then
    echo "Only SARAH"
    exit
fi    
MODEL=$( echo $MODEL | sed s'/\//-/g')
MODELS=$( echo $MODEL | sed s'/\-//g')
cp -r ../SARAH/Output/$MODEL/EWSB/SPheno/ ../SPHENO/$MODELS
MODEL=$MODELS
cd ../SPHENO
if [ "$(grep -E '\#\s*F90\s*=\s*gfortran' Makefile)" ];then
    sed -i 's/\# F90 = gfortran/F90 = gfortran/' Makefile
    sed -ri 's/^F90 = ifort/\# F90 = ifort/' Makefile
fi    
	 
make Model=$MODEL

cd -
../SPHENO/bin/SPheno$MODEL ../SPHENO/$MODEL/Input_Files/LesHouches.in.$MODEL
echo  $(grep -i -A2 'block mass' SPheno.spc.$MODEL  | grep -E '\s+25' | awk '{print $2}') == 1.27270603E+02


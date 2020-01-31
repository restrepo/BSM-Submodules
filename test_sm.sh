#!/usr/bin/env bash
if [ ! "$1" ];then
    MODEL=SM
else
    MODEL="$1"
fi

math << EOI || die
      <<"SARAH/SARAH.m"
      Start["$MODEL"];
      MakeSPheno[];
EOI
cp -r SARAH/Output/$MODEL/EWSB/SPheno/ SPHENO/$MODEL
cd SPHENO
make Model=$MODEL
mkdir -p  ../test_sm
cd ../test_sm
if [ $MODEL == SM ];then
    mh=1.27939961E+02
elif [ $MODEL == SSDM ]; then
    mh=1.30287679E+02
else
    mh=1.27939961E+02
fi
../SPHENO/bin/SPheno$MODEL ../SPHENO/$MODEL/Input_Files/LesHouches.in.$MODEL
echo  $(grep -i -A30 'block mass' SPheno.spc.$MODEL | grep -E '^\s*[0-9]+\s+[0-9]\.[0-9]+[Ee][+\-][0-9]+\s+\#\s*[A-Za-z0-9_]+$' | grep -E '\s+25' | awk '{print $2}') == $mh


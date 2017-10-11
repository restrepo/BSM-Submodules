#!/usr/bin/env bash
math << EOI || die
      <<"SARAH/SARAH.m"
      Start["SM"];
      MakeSPheno[];
EOI
cp -r SARAH/Output/SM/EWSB/SPheno/ SPHENO/SM
cd SPHENO
make Model=SM
mkdir -p  ../test_sm
cd ../test_sm
../SPHENO/bin/SPhenoSM ../SPHENO/SM/Input_Files/LesHouches.in.SM
echo  $(grep -i -A2 'block mass' SPheno.spc.SM  | grep -E '\s+25' | awk '{print $2}') == 1.27270603E+02


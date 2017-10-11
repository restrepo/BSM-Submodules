#!/usr/bin/env bash
cd SPHENO
if [ "$(grep -E '\#\s*F90\s*=\s*gfortran' Makefile)" ];then
    sed -i 's/\# F90 = gfortran/F90 = gfortran/' Makefile
    sed -ri 's/^F90 = ifort/\# F90 = ifort/' Makefile
fi    

cd ../calchep
make
make
cd ../micromegas
make
make

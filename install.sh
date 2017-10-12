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

# Install generaed codes in several tools
MODELp=$(git branch | sed -r 's/^\*\s+//')
#TODO: Check against SARAH/Models DIRs
if [ "$MODELp" != master ];then
    MODELDIR=$(echo $MODELp | awk -F'+' '{print $1}' )
    MODEL=$(echo $MODELp | awk -F'+' '{print $2}' )
    if [ "$(echo $MODEL | awk -F'+' '{print $2}' )" ];then
       echo ERROR: third level models not yet implemented
       exit
    fi
    sep='/'
    if [ ! $MODEL ];then
	MODEL=MODELDIR
	MODELDIR=''
	sep=''
    fi
    if [ ! -d SARAH/Models/$MODELDIR$sep$MODEL ] && [ -d  BSM/SARAH/Models$MODELDIR$sep$MODEL ]; then
	cp -r BSM/SARAH/Models/$MODELDIR  SARAH/Models
    fi
    for tool in  SPHENO micromegas madgraph:
        if [ ! -d $tool/$MODELDIR$MODEL ] && [ -d  BSM/SPHENO/$MODELDIR$MODEL ]; then
	    cp -r BSM/SPHENO/$MODELDIR$MODEL $tool
        fi    		     
	
fi

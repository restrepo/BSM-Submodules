#!/usr/bin/env bash
#http://www.artificialworlds.net/blog/2012/10/17/bash-associative-array-examples/
source functions.sh
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

# Install generated codes in several tools
#get MODEL
MDL #from functions.sh: fill global arrat mdl
MODELDIR=mdl[MODELDIR]
MODEL=mdl[MODEL]
sep=mdl[sep]
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
	MODEL=$MODELDIR
	MODELDIR=''
	sep=''
    fi
    if [ ! -d SARAH/Models/$MODELDIR$sep$MODEL ] && [ -d  BSM/SARAH/Models$MODELDIR$sep$MODEL ]; then
	cp -r BSM/SARAH/Models/$MODELDIR  SARAH/Models
    fi
    declare -A ModelDir=( [SPHENO]="" [calchep]=""  [micromegas]="" [madgraph]=models )
    declare -A ModelExec=( [SPHENO]="" [calchep]="./mkWORKdir"  [micromegas]="./newProject" [madgraph]=""  )
    for tool in "${!ModelDir[@]}";do
	if [ ! -d $tool/${ModelDir[$tool]}$MODELDIR$MODEL ] && [ -d  BSM/SPHENO/$MODELDIR$MODEL ]; then
	    if [ "${ModelExec[$tool]}" ];then
		cd $tool
		${ModelExec[$tool]} $MODELDIR$MODEL
		cd ..
	    fi
	    cp -r BSM/SPHENO/$MODELDIR$MODEL $tool/${ModelDir[$tool]}
        fi    		     
	
fi

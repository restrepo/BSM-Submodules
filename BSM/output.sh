#!/usr/bin/env bash
#http://www.artificialworlds.net/blog/2012/10/17/bash-associative-array-examples/
source ../functions.sh
#get MODEL
MDL #from functions.sh: fill global arrat mdl
MODELDIR=${mdl[MODELDIR]}
MODEL=${mdl[MODEL]}
sep=${mdl[sep]}

#Check
if [ -d SARAH/Models/$MODELDIR$sep$MODEL ];then
    mkdir -p ../SARAH/Models/$MODELDIR$sep$MODEL
    cp -r SARAH/Models/$MODELDIR$sep$MODEL/*  ../SARAH/Models/$MODELDIR$sep$MODEL
fi


declare -A ModelDir=( [SPHENO]=SPheno [calchep]=CHep  [micromegas]=CHep [madgraph]=UFO )
SARAHDIR=../SARAH/Output/$MODELDIR$MODEL/EWSB
for tool in "${!ModelDir[@]}";do   
    if [ -d $SARAHDIR/${ModelDir[$tool]} ];then
	mkdir -p $tool/$MODELDIR$MODEL
	cp -r $SARAHDIR/${ModelDir[$tool]}/* $tool/$MODELDIR$MODEL
    fi
done
#version=$( grep -E "version\s*=" ../SPHENO/src/Control.F90  | awk -F'"|"' '{print $2}')
# git tag --sort -"v:refname"
# manage tags: https://stackoverflow.com/a/5480292/2268280

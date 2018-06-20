#!/usr/bin/env bash
#http://www.artificialworlds.net/blog/2012/10/17/bash-associative-array-examples/
source ../functions.sh
#get MODEL
MDL #from functions.sh: fill global arrat mdl
MODELDIR=${mdl[MODELDIR]}
MODEL=${mdl[MODEL]}
sep=${mdl[sep]}
sep_sarah=''
if [ "$sep" == '/' ];then
    sep_sarah='-'
fi    
 
#Check
# Creates Model if it did not exists

if [ ! -d ../SARAH/Models/$MODELDIR$sep$MODEL ] && [ -d SARAH/Models/$MODELDIR$sep$MODEL ];then
    mkdir -p ../SARAH/Models/$MODELDIR$sep$MODEL
    cp -r SARAH/Models/$MODELDIR$sep$MODEL/*  ../SARAH/Models/$MODELDIR$sep$MODEL
fi
if [ -d ../SARAH/Models/$MODELDIR$sep$MODEL ] && [ ! -d SARAH/Models/$MODELDIR$sep$MODEL ];then
    printf "SARAH model found in official repo. cp $MODELDIR$sep$MODEL in SARAH/Models/? (y/n)  \n "
    read yn
    if [ "$yn" == y ];then
	mkdir -p SARAH/Models/$MODELDIR$sep$MODEL
        cp -r ../SARAH/Models/$MODELDIR$sep$MODEL/* SARAH/Models/$MODELDIR$sep$MODEL  
    fi
fi

declare -A ModelDir=( [SPHENO]=SPheno [calchep]=CHep  [micromegas]=CHep [madgraph]=UFO )
SARAHDIR=../SARAH/Output/$MODELDIR$sep_sarah$MODEL/EWSB
for tool in "${!ModelDir[@]}";do
    BSMDIR="$(echo $tool/$MODELDIR$MODEL | sed 's/-//g')"

    if [ -d $SARAHDIR/${ModelDir[$tool]} ];then # easy update
	mkdir -p $BSMDIR
	cp -r $SARAHDIR/${ModelDir[$tool]}/* $BSMDIR
    else
	printf "ERROR run:\ncd ..\n./install --butler first\n"
	exit
    fi
    oldpwd="$PWD"
    cd ../$tool
    VERSION=$(git tag --sort -"v:refname"| head -1  )
    
    if  [ "$VERSION" ];then
	echo $VERSION > "$oldpwd"/$BSMDIR/VERSION
    fi
    cd -
done
#version=$( grep -E "version\s*=" ../SPHENO/src/Control.F90  | awk -F'"|"' '{print $2}')
# 
# manage tags: https://stackoverflow.com/a/5480292/2268280
# Install also RGE's
if [ -d $SARAHDIR/../RGEs ];then # easy update
    cp -r $SARAHDIR/../RGEs SARAH/Output/$MODELDIR$sep_sarah$MODEL
else
    printf "ERROR run:\ncd ..\n./install --butler first\n"
    exit
fi

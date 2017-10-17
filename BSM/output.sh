#!/usr/bin/env bash
#http://www.artificialworlds.net/blog/2012/10/17/bash-associative-array-examples/
source ../functions.sh
#get MODEL
MDL #from functions.sh: fill global arrat mdl
MODELDIR=${mdl[MODELDIR]}
MODEL=${mdl[MODEL]}
sep=${mdl[sep]}

declare -A ModelDir=( [SPHENO]=SPheno [calchep]=CHep  [micromegas]=CHep [madgraph]=UFO )
SARAHDIR=../SARAH/Output/$MODELDIR$MODEL/EWSB
for tool in "${!ModelDir[@]}";do   
    if [ -d $SARAHDIR/${ModelDir[$tool]} ];then
	mkdir -p $tool/$MODELDIR$MODEL
	cp -r $SARAHDIR/${ModelDir[$tool]}/* $tool/$MODELDIR$MODEL
    fi
done    

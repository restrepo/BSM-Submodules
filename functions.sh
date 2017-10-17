#!/usr/bin/env bash
declare -A mdl
function MDL {
    MODEL=SM
    MODELDIR=''
    sep=''

    MODELp=$(git branch | grep ^* | sed -r 's/^\*\s+//')
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
    fi   
    mdl[MODEL]=$MODEL
    mdl[MODELDIR]=$MODELDIR
    mdl[sep]=$sep
    }

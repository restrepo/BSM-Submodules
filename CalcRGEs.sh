#!/usr/bin/env bash
source functions.sh

MDL #from functions.sh: fill global arrat mdl
MODELDIR=${mdl[MODELDIR]}
MODEL=${mdl[MODEL]}
sep=${mdl[sep]}


math << EOF
<<SARAH/SARAH.m
Start["$MODELDIR$sep$MODEL"] 
CalcRGEs[]
EOF





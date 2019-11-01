#!/usr/bin/env bash
# It is assumed that you are in a parent directory with
# SARAH ans SPheno GitHub repo
# and the tarball for the requested version
if [ "$1" ];then
    v=$1
    chkv=$( echo $v | grep -E "[0-9]+\." )
    if [ ! "$chkv" ];then
	echo ERROR! Wrong version format
	exit
    fi
else
    echo "USAGE: $0 N.NN.N # e.g: 4.14.3"
    exit
fi
SARAH=SARAH
tarball=SARAH-$v.tar.gz
SPheno=SPheno
MODEL=SSDM
pdgchk=6666635
testmass=2.83944658E+01


if [ ! -d "$SARAH" ];then
    echo "First clone SARAH GitHub repo"
    exit
fi
if [ ! -f "$tarball" ];then
    echo "First download $tarball"
fi


tar -zxvf "$tarball" -C "$SARAH" --strip-components=1

cd "$SARAH"
find . -type d -empty -not -path "./.git/*" -exec touch {}/.gitkeep \;
git add .
git commit -am "v$v"
echo "CREATED COMMIT v$v. See 'git log' for details inside $SARAH"
cd ..
if [ ! -d "$SPheno" ];then
    echo "Clone SPheno GitHub repo to test SM"
    exit
fi

if [ $(which math) ];then
   echo "TEST with $MODEL"
   math << EOF
   <<./$SARAH/SARAH.m
   Start["$MODEL"]
   MakeSPheno[]
EOF
else
    echo ERROR! not Mathematica installation found
fi

if [ -d $SARAH/Output/SSDM/EWSB/SPheno ];then
    cp -r $SARAH/Output/SSDM/EWSB/SPheno $SPheno/$MODEL
    cd $SPheno
    make Model=$MODEL
    cd ..
else
    echo ERROR!: SARAH compilation failed
fi

if [ -x $SPheno/bin/SPheno$MODEL ];then
    if [ -f $SPheno/$MODEL/Input_Files/LesHouches.in.$MODEL ]; then
	cp $SPheno/$MODEL/Input_Files/LesHouches.in.$MODEL .
    else
	echo ERROR! SPheno compilation failed
        exit
    fi
    $SPheno/bin/SPheno$MODEL LesHouches.in.$MODEL
fi

MS=$(grep -iE -A20 "^block mass" SPheno.spc.SSDM | grep -E "^\s+$pdgchk" | awk '{print $2}')

python <<EOF > /tmp/kk$USER
print( '{}'.format(  abs($MS-$testmass)<1E-6 ) )
EOF

if [ $(grep True /tmp/kk$USER) ];then
    echo OK: TEST PASSED
else
    echo ERROR: Test Failed!
fi




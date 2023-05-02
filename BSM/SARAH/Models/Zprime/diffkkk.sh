rm kkk; math << EOF  >> kkk
<<./SARAH/SARAH.m
Start["DarkPhoton"]
MakeSPheno[]
EOF
diff kk kkk | grep -v Time | grep -v -E '[0-9]s' | grep -v -E '[0-9\-]{3}'

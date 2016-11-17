# !/bin/bash

prioridad=$1
aux="aux.dat"
grep "^.*;.*;$prioridad;[6-9][0-9]\{3\},[0-9]\+;.*" datos.txt > $aux
grep "^.*;.*;$prioridad;6[0-9]\{3\},[0-9]\+;.*" datos.txt >> $aux
grep "^.*;.*;$prioridad;5[3-9][0-9]\{2\},[0-9]\+;.*" datos.txt >> $aux
grep "^.*;.*;$prioridad;52[7-9][0-9]\{1\},[0-9]\+;.*" datos.txt >> $aux
grep "^.*;.*;$prioridad;526[9],[0-9]\+;.*" datos.txt >> $aux
grep "^.*;.*;$prioridad;5268,9[0-9];.*" datos.txt >> $aux
grep "^.*;.*;$prioridad;5268,90;.*" datos.txt >> $aux
grep "^.*;.*;$prioridad;[0-9]\{5\}\+,[0-9]\+;.*" datos.txt >> $aux

sed 's/\(.*\);.*;.*;\(.*\);\(.*\);.*/\1 \2 \3/' $aux

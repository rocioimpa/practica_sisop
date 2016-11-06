#!/bin/bash
legajo=`grep ."*"`
resultado=$(grep "$legajo" "Notas.dat" | sed 's/.*;.*;\(A+\)/APROBADO/' | sed 's/.*;.*;\(A-\)/APROBADO/' | sed 's/.*;.*;\(A\)/APROBADO/' | sed 's/.*;.*;\(.*\)/NO APROBADO/')
echo $legajo","$resultado
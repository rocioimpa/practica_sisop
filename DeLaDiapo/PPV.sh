#!/bin/bash
telefono=$1
codigo_cliente=$2
canal=$3

codigo_area=$(echo $telefono | sed 's/([0-9][0-9])(\([0-9]\{6\}\))[0-9]\{4\}/\1/')
senial=$(grep ".*;.*;$codigo_area;$canal;.*" "Signals&Chanels.dat" | sed 's/.*;\(.*\);.*;.*;.*/\1/')
./RegistrarVentaPPV.sh $codigo_cliente $senial

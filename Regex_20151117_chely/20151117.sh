#!/bin/bash

nombre_usuario=$1
registro=$(grep "$nombre_usuario" "Usuarios.dat")
identificador=$(echo $registro | sed 's/^\(.*\);.*;.*;.*$/\1/')
resultados=$(grep "$identificador" "EmpresasPorUsuario.dat"\
| sed 's/^\(.*\);.*;\(.*\);\(.*\)$/\1,\3,\2/'\
| sed 's/^\(.*\),0$/\1,Inactivo/'\
| sed 's/^\(.*\),1$/\1,Activo/')
echo $resultados
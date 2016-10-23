#!/bin/bash
#eleccion.result = codigo_localidad:
# 				   x:
# 				   nombre_localidad:
# 				   x:
# 				   numero_orden:
# 				   cantidad_votos:
# 				   x:
# 				   nombre_partido

codigo_localidad=$1
numero_de_orden=$2

resultados=$(grep "$codigo_localidad:.*:.*:.*:$numero_de_orden:.*:.*:.*" "Eleccion.Result")
cantidad_votos=$(echo $resultados | sed 's/.*:.*:.*:.*:.*:\(.*\):.*:.*/\1/')
nombre_partido=$(echo $resultados | sed 's/.*:.*:.*:.*:.*:.*:.*:\(.*\)/\1/')
echo "$nombre_partido-$cantidad_votos"
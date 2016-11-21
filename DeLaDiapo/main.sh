#!/bin/bash
#Para la integración con el sistema de control de sucursales, la empresa nos pide
#desarrollar un script que reciba una novedad del inventario centralizado y la impacte en
#el stock de las sucursales.
#El script se llamará RegistrarNovedadStock.sh, debe recibir como parámetro el centro
#logístico, la identificación del producto, el tipo de operación y la cantidad, debe deducir la
#sucursal relacionada y traducir el tipo de operación al código de novedad para finalmente
#invocar a un API del sistema de sucursales llamada UpdateStock.
#El código de retorno del script debe ser el mismo código que devuelve el API.
#En caso de no poder obtener la sucursal o el código de novedad, se debe invocar al API
#con el valor ‘X’ en el parámetro que no se pudo obtener.
#Ejemplo de invocación del script:
#RegistrarNovedadStock.sh <centro_logistico> <cantidad> <id_producto> <tipo_operación>
#Ejemplo de invocación del API:
#UpdateStock <sucursal> <código_novedad> <id_producto> <cantidad>
#Para obtener la sucursal y el código de novedad
#MapeoSucursal.dat, que posee el siguiente formato:
#se cuenta con el archivo
#Como máximo hay una sola instancia ‘ACTIVA’ para la dupla CLASE_MAPEO y VALOR_ORIGEN
#centro=$1
#cantidad=$2
#id_producto=$3
#tipo_op=$4
#
#grep "$id_producto;$tipo_op;.*;.*;.*;ACTIVA" "MapeoSucursal.dat"

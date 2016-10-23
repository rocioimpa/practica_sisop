#!/bin/bash

#sol_fact_20160517

#supongo que todos los meses tienen 30 dias
#ok=$(echo $1 | sed 's/^sol_fact_\([0-9]\{4\}\(\([0][1-9]\)\|(\[1][0-2]\)\)\(\([0][1-9]\)\|\([1-2][0-9]\)\|\([3][0]\)\)\)/\\1/g')

validarFecha(){
	arch=$1
	fecha_actual=`date +%Y%m%d`
	fecha_archivo=${arch:9:8}

	if [[ $fecha_actual -ge $fecha_archivo ]]; then
		echo 1
	fi
	echo 0
}

mkdir resultados
mkdir rechazados

for archivo in $(ls input); do
	if [[ ! $(validarFecha archivo) ]]; then
		mv input/$archivo rechazados
	else
		mv input/$archivo resultados
	fi

done

cd resultados

for archivoAceptado in $(ls); do
	fecha=${archivoAceptado:9:8}
	IFS=',' read -r id_servicio id_cuenta importe region fecha_vto < $archivoAceptado
	existe=$(cat ../mae/segba.dat | grep "$id_servicio,.*,$region")
	if [[ $existe == '' ]]; then
		mv $archivoAceptado ../rechazados
	else
		IFS=',' read -r a b c porcentaje <<< "$existe"
		existeTarifaSocial=$(cat ../mae/tarifa_social.dat | grep "$id_cuenta")
		if [[ ! $existeTarifaSocial == '' ]]; then
			porcentaje=0
		fi
	fi
	nuevo_importe=`expr $importe + $importe \* $porcentaje`
	$(echo "$id_servicio,$id_cuenta,$nuevo_importe,$fecha_vto" >> nueva_fact_$fecha)

done
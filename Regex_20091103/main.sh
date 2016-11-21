#!/bin/bash
#Una empresa de servicios públicos requiere que hagamos un script que muestre por salida standard
#cuántos técnicos pueden realizar una tarea en el domicilio de un cliente en un día determinado.
#Solo está permitido utilizar los comandos grep, sed, vi, echo, wc
#
#Ejemplo de ejecución:
#>script.sh AVELLANEDA JUEVES
#Pueden realizar un tarea en AVELLANEDA un JUEVES: 3 técnicos
#
#Toda la información necesaria se encuentra en un archivo con el siguiente formato:
#DATOS.dat
#−− Información de los turnos de trabajo.
#NRO_TURNO: identificador de turno
#DIAS_DE_SEMANA: Lista con los nombres de los días de la semana separados por ','
#HORA_DE_ENTRADA: Hora de entrada con formato HH:MI:SS
#HORA_DE_SALIDA: Hora de salida con formato HH:MI:SS
#−− Información de los técnicos
#NOMBRE_TECNICO: Nombre completo
#LOCALIDAD: Nombre de la localidad donde realiza su trabajo
#
#Lo curioso es que el separador de campo de la información de los turnos es ';',
#el separador de la información de los técnicos es ':' y la separación entre la información de turnos y
#la de técnicos es '_'
#Ejemplo
#1;LUNES,MARTES,MIERCOLES,VIERNES,SABADO;08:00;14:00_Ricardo_Rodriguez:MORON
#
#Se reciben los parametros
localidad=$1
dia=$2
resultados=$(grep -c "^.*;.**$dia.**;.*;.*_.*:$localidad" "DATOS.dat")
echo "Pueden realizar una tarea en $localidad un $dia: $resultados"

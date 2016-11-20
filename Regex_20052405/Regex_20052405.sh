# Una empresa de servicios públicos requiere que hagamos un script que muestre por slaida standard
# cuántos técnicos pueden realizar una tarea en el domicilio de un cliente en un día determinado.
# Sólo está permitido utilizar los comandos grep, sed, vi, echo y wc
#
# Para facilitar las cosas el script recibe como parámetro la localidad y el nombre del día de la semana
# Ejemplo de ejecución: \>script.sh AVELLANEDA JUEVES
# Pueden realizar una tarea en AVELLANDEA un JUEVES: 3 técnicos.
# Toda la información necesaria se encuentra en un archivo con el siguiente formato:
# DATOS.dat
# –Informacion de los turnos de trabajo\
# NRO_TURNO:identificador de turno
# DIAS_DE_SEMANA:Lista con los nombres de los días de la semana separados por ”,”
# HORA_ENTRADA:Hora de entrada con formato HH:MM
# HORA_SALIDA:Hora de salida con formato HH:MM
# –Informacion de los tecnicos
# NOMBRE_TECNICO:Nombre completo
# LOCALIDAD:Nombre de la localidad donde realiza su trabajo
#
# El separador de campo de la informacion de los turnos es ”;” y el separador de la informacion de los
# tecnicos es ”:” y la separacion entre la informacion de turnos y de tecnicos es “_”
#
# Ejemplo: 1;LUNES,MARTES,MIERCOLES,VIERNES,SABADO;08:00;14:00_Ricardo Rodriguez:MORON

# !/bin/bash
localidad=$1
dia_semana=$2

resultados=$( grep -o ".*;\(,?\)$dia_semana,.*;[0-9][0-9]:[0-9][0-9];[0-9][0-9]:[0-9][0-9]_.*:$localidad" DATOS.dat | wc -l )
echo "$resultados"

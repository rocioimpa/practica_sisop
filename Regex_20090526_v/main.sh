#!/bin/bash
#Una empresa operadora de telefonia recibe diariamente novedades de un ente llamado ABD que administra
#la base de datos unificada de los clientes de todas las operadoras. Las novedades son diferentes tipos
#de solicitudes de tramites que se deben realizar en el sistema de gestion de clientes propio.
#Existe un archivo que relaciona el codigo de novedad informado por el ABD y el tipo de solicitud del
#sistema propio, puede existir solo una relacion activa. Se pide realizar un script que reciba
#como parametro un tipo de solicitud y genere un archivo con las novedades recibidas con el codigo
#correspondiente a ese tipo.
#
#El archivo de novedades se llama NOVEDADES.dat, el separador de campos es el '+' y posee varios campos.
#Solo nos interesan los siguientes campos que se encuentran en forma contigua desde el inicio del registro:
#
#CODIGO_NOVEDAD+FECHA_DESDE+FECHA_HASTA+NRO_LINEA+OPERADOR_NUEVO+OPERADOR_VIEJO...
#El archivo de relacion se llama TRADUCTOR.info, el separador de campos es el '/' y posee el siguiente formato:
#
#CODIGO_NOVEDAD/TIPO_SOLICITUD/ACTIVO/FECHA_ULTIMA_MODIFICACION/ID_ULTIMO_MODIFICADOR
#Los valores posibles para el campo ACTIVO son 'S' o 'N'
#
#El archivo de salida debe llamarse NOVEDADES_INBOUND.dat, con ':' como separador de campos y con el
#siguiente formato:
#
#TIPO_SOLICITUD:NRO_LINEA:OPERADOR_NUEVO:OPERADOR_VIEJO:FECHA_DESDE:FECHA_HASTA
#Importante: solo se pueden utilizar los comandos grep y sed. No se permiten expresiones regulares extendidas.

tipo_solicitud=$1
archivo_salida="NOVEDADES_INBOUND.dat"
codigo_novedad=$(grep ".*/$tipo_solicitud/S/.*/.*" "TRADUCTOR.info" | sed 's@\(.*\)/.*/.*/.*/.*@\1@')
resultados=$(grep "$codigo_novedad+.*+.*+.*+.*+.*+.**" "NOVEDADES.dat" | sed 's/.*+\(.*\)+\(.*\)+\(.*\)+\(.*\)+\(.*\)+.*/\3:\4:\5:\1:\2/')
echo "$tipo_solicitud:$resultados" > $archivo_salida

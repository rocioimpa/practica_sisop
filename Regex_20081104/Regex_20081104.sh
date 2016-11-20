# 04/11/2008
# Una comercializadora de bebidas nos pide que desarrollemos un script que reciba Bodega y año de cosecha
# como parámetros obligatorios y muestre por pantalla el nombre de etiqueta de todos los registros que sean
# de esa bodega, de ese año y existan hasta 95 botellas.
# Para ello contamos con un archivo llamado WINE_STOCK.dat con el siguiente formato:
#
# Establecimiento|Bodega|Etiqueta|Fecha de cosecha|Cantidad de botellas|Composición
#
# El formato de Fecha es dd-mm-aaaa
#
# Importante: Solo se pueden utilizar los cmds grep y sed. No se permiten expresiones regulares extendidas.

# !/bin/bash

bodega=$1
anio_cosecha=$2

#RESOLUCION 1: Usando un archivo auxiliar
#resultados="auxiliar.dat"
#grep ".*|$bodega|.*|.*-.*-$anio_cosecha|9[0-5]|.*" WINE_STOCK.dat | sed 's/.*|.*|\(.*\)|.*|.*|.*/\1/' > $resultados
#grep ".*|$bodega|.*|.*-.*-$anio_cosecha|[0-8][0-9]|.*" WINE_STOCK.dat | sed 's/.*|.*|\(.*\)|.*|.*|.*/\1/' >> $resultados
#grep ".*" $resultados # Muestro todos los registros que se encuentran en el archivo

#RESOLUCION 2 (me gusta mas): Usando variables
resultados=$( grep ".*|$bodega|.*|.*-.*-$anio_cosecha|9[0-5]|.*" WINE_STOCK.dat | sed 's/.*|.*|\(.*\)|.*|.*|.*/\1/' )
resultados+=$( grep ".*|$bodega|.*|.*-.*-$anio_cosecha|[0-8][0-9]|.*" WINE_STOCK.dat | sed 's/.*|.*|\(.*\)|.*|.*|.*/\1/' )
echo "$resultados"

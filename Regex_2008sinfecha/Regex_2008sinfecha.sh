# Un restaurant nos pide realizar un script que muestre los vinos de su cava con año de cosecha anterior a 2002.
#
# Para esto contamos con el archivo CAVA.stk del que SOLO sabemos lo siguiente:
# Sus campos se encuentran separados por '+'
# El primer campo es el nombre de etiqueta.
# El segundo campo es la nota de cata.
# El tercer campo es el cepaje. En caso de ser un vino de corte este campo se encuentra nulo.
# El cuarto campo es el maridaje sugerido.
# El quinto campo es la temperatura de servicio.
# El sexto campo es el año de cosecha.
# El séptimo campo es la bodega.
# etiqueta+cata+cepaje+maridaje_sugerido+temperatura_de_servicio+anio_cosecha+bodega
#
# La información a listar debe incluir el nombre de etiqueta, la bodega y si es o no un vino de corte.
#
# Ejemplo de salida:
# MALBEC D.O.C Luigi Bosca NO CORTE
# CASTEL Bodega Chandon CORTE
#
# Importante: solo se pueden usar los comandos grep y sed.

# !/bin/bash

resultados=$( grep ".*+.*+.*+.*+.*+200[0-2]+.*" CAVA.stk | sed 's/\(.*\)+.*+\(\)+.*+.*+.*+\(.*\)/\1 \3 \NO CORTE/' | sed 's/\(.*\)+.*+\([A-Za-z]\+\)+.*+.*+.*+\(.*\)/\1 \3 \2/' )
resultados+=$( grep ".*+.*+.*+.*+.*+19[0-9][0-9]+.*" CAVA.stk | sed 's/\(.*\)+.*+\(\)+.*+.*+.*+\(.*\)/\1 \3 \NO CORTE/' | sed 's/\(.*\)+.*+\([A-Za-z]\+\)+.*+.*+.*+\(.*\)/\1 \3 \2/' )
resultados+=$( grep ".*+.*+.*+.*+.*+18[0-9][0-9]+.*" CAVA.stk | sed 's/\(.*\)+.*+\(\)+.*+.*+.*+\(.*\)/\1 \3 \NO CORTE/' | sed 's/\(.*\)+.*+\([A-Za-z]\+\)+.*+.*+.*+\(.*\)/\1 \3 \2/' ) #asumo que no hay vinos con cosecha anterior a 1800
echo "$resultados"

# Se pide realizar un script que reciba por parámetro el número de cliente y muestre por salida standard
# el nombre del cliente, junto con las fechas y los importes de las facturas de monto mayor a $3000.01
#
# Para esto contamos con un archivo llamado CLIENTES.dat del que sólo sabemos lo siguiente:
# Sus campos están separados por el caracter ”:”
# El primer campo contiene el número de cliente
# El tercer campo contiene el nombre del cliente
# El séptimo campo contiene el cuit del cliente
#
# También contamos con un archivo llamado FACTURAS.dat del que sólo sabemos lo siguiente:
# Sus campos están separados por el caracter ”;”
# El primer campo contiene el número de cliente
# El segundo campo contiene la fecha de la factura
# El cuarto campo contiene el importe de la factura
# El sexto campo contiene la moneda de la factura
# El séptimo campo contiene el cuit del cliente
# IMPORTANTE: Sólo se pueden utilizar los comandos grep, sed, wc y echo

# !/bin/bash
num_cliente=$1
nombre_cliente=$( grep "$num_cliente:.*:.*" CLIENTES.dat | sed 's/.*:.*:\(.*\):.*:.*:.*:.*/\1/' )
resultados=$( grep "$num_cliente;.*;.*;3000,0[1-9][0-9]*;.*;.*;.*" FACTURAS.dat | sed 's/.*;\(.*\);.*;\(.*\);.*;.*;.*/Fecha: \1 Importe: $\2 / ' )
resultados+=$( grep "$num_cliente;.*;.*;3[0-9]\{2\}[1-9],[0-9]*;.*;.*;.*" FACTURAS.dat | sed 's/.*;\(.*\);.*;\(.*\);.*;.*;.*/Fecha: \1 Importe: $\2 / ' )
resultados+=$( grep "$num_cliente;.*;.*;3[0-9][1-9][0-9],[0-9]*;.*;.*;.*" FACTURAS.dat | sed 's/.*;\(.*\);.*;\(.*\);.*;.*;.*/Fecha: \1 Importe: $\2 / ' )
resultados+=$( grep "$num_cliente;.*;.*;3[1-9][0-9]\{2\},[0-9]*;.*;.*;.*" FACTURAS.dat | sed 's/.*;\(.*\);.*;\(.*\);.*;.*;.*/Fecha: \1 Importe: $\2 / ' )
resultados+=$( grep "$num_cliente;.*;.*;[4-9][0-9]\{3\},[0-9]*;.*;.*;.*" FACTURAS.dat | sed 's/.*;\(.*\);.*;\(.*\);.*;.*;.*/Fecha: \1 Importe: $\2 / ' )
resultados+=$( grep "$num_cliente;.*;.*;[0-9]\{5,\},[0-9]*;.*;.*;.*" FACTURAS.dat | sed 's/.*;\(.*\);.*;\(.*\);.*;.*;.*/Fecha: \1 Importe: $\2 / ' )
echo Nombre cliente: $nombre_cliente
echo "$resultados"

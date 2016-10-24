# Se reciben diariamente en el directorio $HOME/arribos archivos de diferentes puntos de ventas, con informacion de venta
# de modems, el formato de los archivos es nro_factura,id_modem,fecha,cantidad
# Tambien tenemos un archivo MODEMS.DAT con la siguiente informacion: id_modem,descripcion_modem,id_gama,importe
# Tambien se cuenta con el archivo GAMA.DAT con los siguientes datos: id_gama,descripcion_gama,descuento_gama

# Se pide realizar un script bash que procese los archivos y genere como salida el archivo /resultados/facturas.txt con
# los siguientes campos: nro_factura|id_modem|fecha|importe_total
# Donde importe_total = importe * descuento_gama * cantidad
# Obtener importe de MODEMS.DAT segun id_modem y descuento_gama de GAMA.DAT segun id_gama
# Los casos para los que no se pueda obtener el importe o el descuento_gama, grabar el registro en errores/errores.txt
# No se deben procesar los registros con cantidad > 10, enviarlos a errores/errores.txt

#!/bin/bash

mkdir resultados
mkdir errores

for archivo in $(ls arribos/*.txt); do
  IFS=',' read -r nro_factura id_modem fecha cantidad < $archivo #lee cada linea del archivo
  #necesito obtener el importe de MODEMS.DAT y el descuento_gama de GAMA.DAT
  existeImporte=$(cat mae/MODEMS.DAT | grep "$id_modem,.*,.*,.*")
  if [[ $existeImporte == '' ]]; then #si el modem no existe y no se puede obtener el importe se manda el registro a errores
    echo "$nro_factura,$id_modem,$fecha,$cantidad" >> errores/errores.txt
    echo "El registro es invalido"
  else
    importe=$(echo $existeImporte | sed 's/.*,.*,.*,\(.*\)/\1/')
    gama=$(echo $existeImporte | sed 's/.*,.*,\(.*\),.*/\1/')
    existeGama=$(cat mae/GAMA.DAT | grep "$gama,.*,.*")
    if [[ $existeGama == '' ]]; then #si la gama no existe, y no se puede obtener el descuento de gama, el registro va a errores
      echo "$nro_factura,$id_modem,$fecha,$cantidad" >> errores/errores.txt
      echo "El registro es invalido"
    else #si se cumple que existe el importe y la gama, verifico que la cantidad sea menor que diez
      descuento_gama=$(echo $existeGama | sed 's/.*,.*,\(.*\)/\1/')
      if [[ $cantidad -gt 10 ]]; then
        echo "$nro_factura,$id_modem,$fecha,$cantidad" >> errores/errores.txt
        echo "El registro es invalido"
      else #se puede calcular el importe total, que es lo que se hace aca
        importe_total=$(echo bc -l $importe \* $descuento_gama \* $cantidad)
        echo "$nro_factura|$id_modem|$fecha|$importe_total" >> resultados/facturas.txt
      fi
    fi
  fi
done

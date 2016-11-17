# !/bin/bash
for archivo in $( ls -A sucursales ); do
    id_sucursal=$( echo $archivo | sed 's/ventas_\(.*\).[0-9]\{6\}/\1/' )
    aniomes=$( echo $archivo | sed 's/ventas_.*.\([0-9]\{6\}\)/\1/' )
    for linea in $( cat dat/sucursales.dat ); do
      id_suc=$( echo $linea | cut -d ',' -f 1 )
      desc=$( echo $linea | cut -d ',' -f 2 )
      impPromMensual=$( echo $linea | cut -d ',' -f 3 )
      descripcion=""
      importe=0
      if [[ $id_sucursal -eq $id_suc ]]; then
        descripcion=$desc
        importe=$impPromMensual
        totalVentas=0
        condicion=""
        echo "$id_sucursal - $descripcion"
        while IFS=';' read -r num_fac fecha importe iva; do
          totalVentas=`expr $totalVentas + $importe`
        done < "sucursales/$archivo"
        if [[ $totalVentas -gt $importe ]]; then
          condicion="mayor"
        elif [[ $totalVentas -eq $importe ]]; then
          condicion="igual"
        else
          condicion="menor"
        fi
        echo "$aniomes - $totalVentas - $condicion"
      fi
    done
done

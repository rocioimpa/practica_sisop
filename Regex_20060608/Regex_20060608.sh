# El archivo llamado MAESTRO.dat posee el siguiente formato:
# Almacen;rack.nivel.columna;material;cantidad;udm;dueño
#
# Los campos están separados por ”;” donde:
#
# Almacén: Nombre del depósito donde se encuentra el material.
# Rack.Nivel.Columna: Este campo contiene la direccion fisica del material, que se define por 3 especies de coordenadas separadas por el caracter ”.”
# Material: Nombre del material que se almacena.
# Cantidad: Cuanto material se almacena. Este campo tiene como separador decimal el caracter ”.”
# Udm: Unidad de Medida en que se expresa la Cantidad
# Dueño: Cliente al que pertenence el material.
# Ejemplo de registros (*)
# Deposito Pte Avellaneda;09.02.03;AK04;8883.3;Kg;AJ04
# Deposito Solis 1793;09.02.03;03OWer;83.3;Kg;VEM2B
# Almacen Caballito-3;09.02.03;AK04;4;Litros;Moreno
# (*)Este ejemplo es a modo ilustrativo y de ninguna manera representa la totalidad de casos posibles
#
# Ocurrio un error durante la generacion del archivo MAESTRO.dat resultando lo siguiente:
#
# La informacion existente en el subcampo “rack” en realidad es la correspondiente al subcampo “columna”.
# La informacion existente en el subcampo “nivel” en realidad es la correspondiente al subcampos “rack”.
# La informacion existente en el subcampo “columna” en realidad es la correspondiente al subcampo “nivel”
# Se pide generar el archivo MAESTRO.ok con la correción del error anteriormente descripto
#
# Importante: Solo se puede utilizar el comando sed

# Entonces se tiene: rack.nivel.columna y tenemos columna.rack.nivel
# !/bin/bash

salida="MAESTRO.ok"
sed 's/\(.*\);\(.*\)\.\(.*\)\.\(.*\);\(.*\);\(.*\);\(.*\);\(.*\)/ \1;\3.\2.\4;\5;\6;\7;\8/' MAESTRO.dat > $salida

#!/bin/bash

#Entrada: Id_sesion|IP_origen|Reingreso|Localidad
#Quedarnos con la linea del ListaDePrecios.dat que tenga Localidad igual a la entrada
#con esa linea: Id_lista;Pais;Prov;Localidad;Estado quedarnos con Id_lista
#Ir al Id_lista correspondiente y hacer la salida
#Salida:
#"Lista de precios: $identificador_de_lista"
#"$producto" + $precio_bruto

entrada=$1
localidad=$(echo $entrada | sed 's/.*|.*|.*|\(.*\)/\1/')
lista_de_precios=$(grep ".*;.*;.*;$localidad;A" ListaDePrecios.dat)
identificador_de_lista=$(echo $lista_de_precios | sed 's/\(.*\);.*;.*;.*;.*/\1/')
sed 's/\(.*\);.*;\(.*\);.*;.*/\1+\2/' "./$identificador_de_lista"

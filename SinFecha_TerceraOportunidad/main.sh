#!/bin/bash
#Para un programa de entretenimientos se nos pide realizar un script que muestre por pantalla “GANO!”
#si para un producto y un número pasados como parámetros, encuentra un registro en el archivo Catalogo_de_Premios.dat,
#que coincida para el nombre del producto al menos uno de sus números
#
#El separador de campos del archivo es ”;” el formato del archivo si bien no es fijo, sigue la siguiente regla:
#CódigoProducto: Código del producto, es obligatorio
#NombreProducto: Nombre del producto, es obligatorio
#Nro1: Primer número, es obligatorio
#Nron: enésimo número, es opcional
#
#Ejemplo
#
#CodigoProducto;NombreProducto;N1;N2;N3;N4;N5;N6;N7;N8;N9;N10;N11
#CodigoProducto;NombreProducto;N1
#CodigoProducto;NombreProducto;N1;N2;N3;N4
#CodigoProducto;NombreProducto;N1;N2;N3;N4;N5;N6;N7
#Solo se pueden usar los comandos grep, sed, wc, echo.

numero=$1
producto=$2
grep ".*;$producto;.**$numero.**" Catalogo_de_Premios.dat | sed 's/.*;.*;.*;.*/\GANO/' 

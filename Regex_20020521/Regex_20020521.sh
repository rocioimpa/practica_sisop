# Resolver el siguiente ejercicio utilizando SOLO el comando sed. NO SE PUEDE utilizar mas de DOS(2) comandos.
#
# Una ferretería tiene su lista de precios en un archivo ASCII con los siguientes campos:
#
# Código de artículo
# Descripción
# Precio unitario
# No hay separadores de campo pero sabemos que:
#
# Todas las descripciones de los items terminan con punto(.).
# Todos los precios unitarios tienen al menos un(1) dígito en su parte enterea y dos(2) dígitos en su parte decimal
# El separador de miles es la coma(,).
# El separador de decimales es el punto(.).
# Ejemplo de archivo
# 20.12345.00.59Tornillo cab, red.23,345.43
# 76.12345.76.59Tornillo cab, cuad.8,787,677.00
# 243.1234Clavo,carp. 0.23
# Se desea generar otro archivo variando el formato de importe de manera que el separador de miles sea el punto(.) y
# el separador de decimales sea la coma(,).

# !/bin/bash
sed "s/\([0-9]\{3,\}\),\([0-9]\{3\}\)/\1.\2/g" listadeprecios.dat | sed "s/\.\([0-9]\{2\}\)$/,\1/g"

# a. Realizar un shell script que busque dentro del archivo de texto palabras en latín pasadas por parámetro.
# b. Reemplace en las líneas que empiezan con E, la quinta palabra por el texto "ELIMINADO"
# c. Elimine las líneas que terminan tienen la palabra "sed"
# d Inserte comentarios con la siguiente notación: "#COMENTARIO: " al final de cada línea

# !/bin/bash

palabra=$1
grep "$1" lipsum.txt
grep "^E.*.$" lipsum.txt | sed 's/\(.* .* .* .* \).* \(.*\)/\1 ELIMINADO \2/'
grep ".*sed." lipsum.txt | sed 's/.*/\ /'
grep ".*$" lipsum.txt | sed 's/\(.*\)/ \1 #COMENTARIO:/'

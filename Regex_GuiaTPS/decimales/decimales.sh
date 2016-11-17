#7 DECIMALES
#Realizar un shell script que busque dentro del archivo datos.txt los números decimales mayores a 7.534
#   1:Juan Perez:9.321
#   2:Juan Paso:3.321
#   3:Matias Perez:7.534
#   4:Fernando Poso:7.999

# !/bin/bash
resultados="resul.txt"
grep ".*:.*:[8-9].[0-9]\{3\}" datos.txt > $resultados
grep ".*:.*:7.[6-9][0-9]\{2\}" datos.txt >> $resultados
grep ".*:.*:7.5[4-9][0-9]" datos.txt >> $resultados
grep ".*:.*:7.53[5-9]" datos.txt >> $resultados
grep ".*:.*:7.534" datos.txt >> $resultados

sed 's/.*:.*:\(.*\)/\1/' $resultados

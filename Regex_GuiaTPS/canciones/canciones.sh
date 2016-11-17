# !/bin/bash
# formato: hh:mm:ss
# indicar si es mayor o menor al limite establecido
# limite = 00:03:12

duracion=$1
#resultado=$( echo $duracion | sed 's/\([0-9][0-9]\):[0-5][4-9]:[2-5][3-9]/\1/' )
resultado=$( echo $duracion | sed 's/[0-9][0-9]:[0-5][4-9]:[1-5][3-9]/\MAYOR /'\
                            | sed 's/[0-9][0-9]:[0-5][4-9]:[1-5][0-9]/\MAYOR /'\
                            | sed 's/00:03:[0-1][0-2]/\MENOR /'\
                            | sed 's/00:03:[0-9][0-9]/\MAYOR /'\
                            | sed 's/00:0[0-2]:[0-1][0-2]/\MENOR /'\
                            | sed 's/00:0[0-2]:[0-9][0-9]/\MENOR /')
echo $resultado

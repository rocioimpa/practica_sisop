#!/bin/bash
mkdir nok
for archivo in $(ls arribos); do
  esValido=1
  esresultado=$(echo $archivo | grep "resultados*")
  if [[ $esresultado ]];then
    distrito_escolar=$(echo $archivo | sed 's/resultados_\(.*\)_.*$/\1/')
    while IFS=';' read -r de descripcion cantidad_escuelas; do
      if [[ $distrito_escolar -eq $de ]];then
        anio=$(echo $archivo | sed 's/resultados_.*_\([0-9]\{4\}\).csv/\1/')
        if [[ $anio -le `date +%Y` ]];then
          while IFS=';' read -r escuela dir prom_h;do
              #echo "ENTRO AL while"
            while IFS=';' read -r escuela1 dni prom; do
              #echo "ENTRO AL while2"
              if [[ $escuela -eq $escuela1 ]];then
                if [[ $prom -lt $prom_h ]]; then
                  echo $escuela "|" $prom_h "|" $dni "|" $prom
                fi
              fi
            done < "arribos/$archivo"
          done < "mae/ESCUELAS.txt"
        else
          esValido=0
        fi
      else
        esValido=0
      fi
    done < "mae/DE.txt"
  else
    esValido=0
  fi
  if [[ ! esValido ]]; then
    mv $archivo "/nok"
  fi
done

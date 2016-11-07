# !/bin/bash

legajo=$( grep ".*" )
resultado=$(grep "$legajo" "Notas.dat" | sed 's/.*,\(I\),.*,.*/\DESAPROBADO/' | sed 's/.*,\(NE\),.*,.*/\DESAPROBADO/' | sed 's/.*,\(N\),.*,.*/\DESAPROBADO/' | sed 's/.*,\(.*\),.*,.*/\APROBADO/')
echo Legajo: $legajo, $resultado

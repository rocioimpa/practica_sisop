# !/bin/bash
dni=$( grep ".*" )
resultados=$( grep ".*;.*;$dni;.*;ACTIVO;.*;.*" Cuentas.Master | sed 's@\(.*\);.*;.*;.*;.*;\([0-9]\{3\}\)/\([0-9]\{8\}\);\(.*\)@\1 \2 \3 \4 @g' )
echo "$resultados"

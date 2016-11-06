# !/bin/bash
nombreUsuario=$1
identificadorUsuario=$( grep ".*,$nombreUsuario,.*,.*" Usuarios.dat | sed 's/\(.*\),.*,.*,.*/\1/' )
resultados=$( grep ".*,$identificadorUsuario,.*,.*" EmpresasPorUsuario.dat | sed 's/\(.*\),.*,\(0\),\(.*\)/\1,\3\,INACTIVO/' | sed 's/\(.*\),.*,\(1\),\(.*\)/\1,\3,\ACTIVO/' )
echo $resultados

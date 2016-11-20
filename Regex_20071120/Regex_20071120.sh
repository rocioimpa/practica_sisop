# Una librería desea que desarrollemos un script para listar la cantidad de títulos existentes en el stock con un valor MAYOR a $987,65 de cada unidad.
#
# Para esto contamos con un archivo llamado StockValorizado.dat del que solo sabemos lo siguiente:
#
# Sus campos están separados por el caracter '='
# El segundo campo contiene el título
# El tercer campo contiene el valor unitario
# Importante: Solo se pueden utilizar los comandos grep, sed, wc y echo.

# !/bin/bash
resultados=$( grep -o ".**=.*=[0-9]\{4,\},[0-9]\+=.**" StockValorizado.dat | wc -l )
resultados1=$( grep -o ".**=.*=9[8-9][7-9],[6-9][5-9][0-9]*=.**" StockValorizado.dat | wc -l )
echo $( expr $resultados + $resultados1 )

# -------------------------------------------
# Ejercicio de regalo (?)
#
# Una librería desea que desarrollemos un script para listar la cantidad de títulos existentes en el stock con un valor MENOR a $987,65 de cada unidad.
#
# Para esto contamos con un archivo llamado StockValorizado.dat del que solo sabemos lo siguiente:
#
# Sus campos están separados por el caracter '='
# El segundo campo contiene el título
# El tercer campo contiene el valor unitario
# Importante: Solo se pueden utilizar los comandos grep, sed, wc y echo.

resultados1=$( grep -o ".**=.*=987,[0-5][0-9]*=.**" StockValorizado.dat | wc -l )
resultados2=$( grep -o ".**=.*=987,6[0-4]*=.**" StockValorizado.dat | wc -l )
resultados3=$( grep -o ".**=.*=98[0-6],[0-9]*=.**" StockValorizado.dat | wc -l )
resultados4=$( grep -o ".**=.*=9[0-7][0-9],[0-9]*=.**" StockValorizado.dat | wc -l )
resultados5=$( grep -o ".**=.*=[0-8][0-9],[0-9]*=.**" StockValorizado.dat | wc -l )
echo $( expr $resultados1 + $resultados2 + $resultados3 + $resultados4 + $resultados5 )

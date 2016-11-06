# !/bin/bash
numFactura=$1
codBoletoBancario=$( grep "$numFactura,.*,.*,.*,.*" FacturasElectronicas.dat | sed 's/.*,.*,\(.*\),.*,.*/\1/' )
urlImgFactura=$( grep "$numFactura,.*,.*,.*,.*" FacturasElectronicas.dat | sed 's/.*,.*,.*,\(.*\),.*/\1/' )
urlImgBoleto=$( grep "$codBoletoBancario,.*,S,.*,.*" BoletosBancarios.dat | sed 's/.*,.*,.*,.*,\(.*\)/\1/' )
numeroCuota=$( grep "$codBoletoBancario,.*,S,.*,.*" BoletosBancarios.dat | sed 's/.*,\(.*\),.*,.*,.*/\1/' )
echo "$urlImgFactura;$numeroCuota;$urlImgBoleto"

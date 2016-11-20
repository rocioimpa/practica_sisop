# Una empresa de medicina prepaga nos encarga el desarrollo de un script para que ante la llamada de un asociado,
# el operador telefónico le pueda informar el nombre y la dirección de los prestadores a los que se puede dirigir
# según la especialidad requerida, el Plan y la Zona donde se encuentre el asociado.
#
# Solo se pueden utilizar los comandos: sed, grep, vi, echo, wc.
#
# Especialidades.dat, el separador de campos es ”:“
# Código de Especialidad: Descripción : Código de Zona
# Ejemplo
# ASD01:Emergencias:Lanus
# C41M:Cuerpo Médico: Capital Federal
# 87INT:Internación:Zona Centro Bs. As.
# CCCC:HHHHH:PPPPPPP
# LFA843:Farmacia:Salta
#
# Prestadores.lis, el separador de campos es ”+“
# Código de Prestador + Nombre + Código de Especialidad + Planes + Dirección
# Ejemplo
# C001+Baywatch+EMER01+Gold, Platinium+Av. del Mar y Playa Bonita
# C001+Emergensub+CCCC-1+0,1+Av. Teniente Gral. J. D. Perón CCCC
# CD001+Dr. Garcia+DRALL+0,1,210,310+ Av. Remedios de Escalada de San Martín 987
# FD00A+Farmacia Villegas+CAMPO03F+CCCC+9 de Julio 87
#
# Parámetros de entrada: Código de Plan, Descripción de Especialidad requerida y Zona donde se encuentra
# Ejemplo de invocación : buscador.sh Gold Farmacia “Patagonia Sudoeste”

# !/bin/bash

plan=$1
especialidad=$2
zona=$3

cod_especialidad=$( grep ".*:.**$especialidad.**:$zona" Especialidades.dat | sed 's/\(.*\):.*:.*/\1/' )
resultados=$( grep ".*+.*+$cod_especialidad+$plan+.*" Prestadores.lis | sed 's/.*+\(.*\)+.*+\(.*\)+\(.*\)/\1  - \2 - \3/' )
echo "$resultados" - $zona

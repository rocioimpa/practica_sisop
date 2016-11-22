#!/bin/bash
#La empresa ShowMovies nos pide realizar un script que liste las películas que no alcanzaron
#los 87 expectadores por función (significa MENOR a 87).
#
#La información a listar debe incluir el nombre del cine, el nombre de la sala y la fecha de proyección.
#
#Para eso contamos con los siguientes archivos:
#
#CINES.dat, del que sólo sabemos lo siguiente:
#
#El primer campo es el nombre del cine
#El segundo campo es la dirección del cine
#El tercer campo es el código postal
#El cuarto campo es la localidad
#El quinto campo es la provincia
#El séptimo campo es la fecha de inicio de actividades
#El octavo campo es la cantidad de salas
#FUNCIONES.dat del que sólo sabemos lo siguiente:
#
#Sus campos se encuentran separados por ”?”
#El primer campo es el número de la película
#El segundo campo es el nombre de la sala
#El cuarto campo es la fecha
#El quinto campo es la cantidad de expectadores
#El sexto campo es el nombre del cine
#IMPORTANTE: Sólo se pueden utilizar los comandos grep y sed

grep ".*?.*?.*?.*?8[0-7]?.*" FUNCIONES.dat | sed 's/.*?\(.*\)?.*?\(.*\)?.*?\(.*\)/\3 \1 \2/'
grep ".*?.*?.*?.*?[0-7][0-9]?.*" FUNCIONES.dat | sed 's/.*?\(.*\)?.*?\(.*\)?.*?\(.*\)/\3 \1 \2/'

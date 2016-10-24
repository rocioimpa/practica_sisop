#!/bin/perl

#sala:
#id_espectador:
#id_pelicula:
#funcion:
#fecha_funcion:
#cantidad_entradas

# 1. Realizar un script en perl
# 2. Invocado con dos parametros, el primer parametro correpsonde al id de un espectador, el segundo corresponde al
# directorio de input. Validar que sean EXACTAMENTE 2 parametros, si hay error mostrar mensaje y terminar el programa
# 3. Validar que en el directorio de input exista al menos un archivo de espectadores. Si el directorio no existe o no
# tiene archivos de espectadores, mostrar mensaje de error y terminar el programa
# 4. Los archivos de espectadores son todos aquellos con extension.dat y tienen el siguiente formato:
# sala:id_espectador:id_pelicula:funcion:fecha_funcion:cantidad_entradas
# 5. Tambien contamos con un archivo en el directorio /catalogos llamado peliculas.mae (validar con file test su 
# existencia). El formato de registro es: id_pelicula:titulo:clasificacion:duracion:direccion:produccion:categoria:protagonistas
# 6. Leer todos los archivos de espectadores (los archivos .dat) del directorio de input (indicado en el parametro 2)
# 7. Para los registros correspondientes al espectador indicado en el parametro 1
# 8. Acumular usando una estructura hash la cantidad de entradas por genero de la pelicula
# 9. (para obtener el genero de una pelicula,usar el archivo peliculas.mae)
# 10. Si el id de pelicula no existe en peliculas.mae, el genero = indeterminado
# 11. Mostrar el resultado del hash Clave=xxxxxxxx Cantidad de entradas=nnnn (un renglon por clave)
# 12. Preguntarle al usuario si desea grabar este resultado en un archivo
# 13. Si responde que no, terminar el programa, si indica si, grabar el archivo <id-espectador>.txt en el directorio /output
# 14. Abrir y cerrar adecuadamente todos los archivos. Si hay algun error mostrar mensaje y terminar el programa


# opendir ( DIR, $dirname ) || die "Error in opening dir $dirname\n";
# while( ($filename = readdir(DIR))){
#      print("$filename\n");
# }
# closedir(DIR);

sub main {
	my $cantidad_argumentos = scalar @ARGV;
	my $id_espectador;
	my $directorio;
	# print $cantidad_argumentos."\n";
	if ( $cantidad_argumentos eq 2 ) {
		$id_espectador = $ARGV[0];
		$directorio = $ARGV[1];
	}
	else {
		die;
	}
	opendir(DIR, $directorio);
	@archivos = readdir(DIR);
	my $numero_archivos = scalar @archivos; 
	#en un directorio siempre habra 2 archivos: './' y '../'
	if( $numero_archivos < 3 ) {
		die "No hay archivos en " . $directorio . "\n";
	}
	closedir(DIR);

	%HASH_PELICULAS=();
	opendir(PELIS, '/catalogos/peliculas.mae'); 
}

main();
#!/bin/bash
# script creado por: Hector A Mantellini @xombra
# Licencia GPLv2
#
# Debe indicar la ruta completa donde realizara la redimension
# $1 = ruta de la imagen -> /home/TUSUARIO/Escritorio/otras/
# $2 = ancho de la imagen
# $3 = tipo de imagen
# ejemplo de uso:
# ./redimensiona.sh /home/xombra/Escritorio/otras 800 jpg
#
# NOTA IMPORTANTE: el nombre de las carpetas no deben contender espacios en Blanco
if [[ -f /usr/bin/mogrify ]]; then
	echo "Leyendo Director" $1
 	echo "Creando archivo temporal de lista de imagenes a procesar"
 	cd $1
 	ls -d * > temp.txt
 	echo "Redimensionando imagenes..."
 	echo "Caracteristicas:"
 	echo "Carpeta principal: "$1" | Ancho: "$2"px | Tipo: "$3
 	echo "Esto puede tardar dependiendo de la cantidad de imagenes"
 	for linea in $(cat temp.txt); do
   		cd $1/$linea/
   		echo "*** Redimensionando imagenes de: $1/$linea/" 
   		mogrify -resize $2 *.$3
   		echo "-------------------------------------------------------";
   		cd ..
 	done
 	echo "Listo!!!"
 	rm -f temp.txt
else
	echo "Error imagemaick no se encuentra instalado"
fi
exit 0

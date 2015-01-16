#!/bin/bash
# script creado por: Hector A Mantellini @xombra
# Licencia GPLv2
#
# Necesario tener instalado ImageMagick
# sudo apt install imagemagick
#  
# Debe indicar la ruta completa donde realizara la redimension
# $1 = ruta de la imagen -> /home/TUSUARIO/Escritorio/otras/
# $2 = ancho de la imagen
# $3 = tipo de imagen
# ejemplo de uso:
# ./redimensiona.sh /home/xombra/Escritorio/otras 800 jpg
#
# NOTA IMPORTANTE: el nombre de las carpetas no deben contender espacios en Blanco
 echo "Leyendo Director $1"
 echo "Creando archivo temporal de lista de imagenes a procesar"
 cd $1
 ls -d * > "temp.txt"
 echo "Redimensionando imagenes..."
 echo "Caracteristicas:"
 echo "Carpeta principal: $1 | Ancho: $2px | Tipo: $3"
 echo "Esto puede tardar dependiendo de la cantidad de imagenes"
 for linea in $(cat temp.txt)
   do
   cd $1/$linea/
   echo "*** Redimensionando imagenes de: $1/$linea/" 
   mogrify -resize $2 *.$3
   echo "-------------------------------------------------------";
   cd ..
 done
 echo "Listo!!!"
 rm -f temp.txt
exit 0

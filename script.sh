while true
do
menu_principal

#--------------------------------------
menu_principal(){
clear
echo "					  ==================================="
echo "					  |     Operaciones disponibles     |"
echo "					  |=================================|"
echo "					  |                                 |"
echo "					  |     1: Gestion de ficheros      |"
echo "					  |     2: Operacion basicas        |"
echo "					  |     3: Gestion de usuarios      |"
echo "					  |     4: Gestion de directorios   |"
echo "					  |     5: Salir del script         |"
echo "					  |                                 |"
echo "					  ==================================="
echo ""
leer_opciones
}

#--------------------------------------
leer_opciones(){
local choice
read -p "Selecciona una opción: " choice
case $choice in
1) menu_ficheros;;
2) menu_opbasicas;;
3) gestion_de_usuarios;;
4) menu_directorios;;
5) salida;;
*) echo "Opcion no valida" && sleep 1 && menu_principal
esac
}

#--------------------------------------
menu_calculadora(){
clear
echo "				==================================="
echo "				|     Operaciones disponibles     |"
echo "				|=================================|"
echo "				|				  |"
echo "				|   	1: Sumar        	  |"
echo "				|   	2: Restar       	  |"
echo "				|   	3: Multiplicar  	  |"
echo "				|   	4: Dividir      	  |"
echo "				|   	5: Volver al inicio	  |"
echo "				|			          |"
echo "				==================================="

introducir_valores
}

#--------------------------------------
operar(){
read -p "¿Que operacion quieres realizar?: " operar
case $operar in
1) sum=`expr $n1 + $n2` ;; #suma
2) sum=`expr $n1 - $n2` ;; #resta
3) sum=`expr $n1 \* $n2` ;; #multiplicacion
4) sum=`expr $n1 / $n2` ;; #division
5) menu_principal ;;
*) echo "La opción no es valida. " ;;
esac
resultado
}

#--------------------------------------
introducir_valores(){
echo "Primero introduce las dos cifras:"
read -p "Primer numero: " n1
read -p "Segundo numero: " n2
operar
}

#--------------------------------------
resultado(){
echo "El resultado de la operacion es: " $sum
sleep 1
menu_principal
}

#--------------------------------------
menu_directorios(){
clear
echo "				==================================="
echo "				|     Operaciones disponibles     |"
echo "				|=================================|"
echo "				|                                 |"
echo "				|     1: Cambiar nombre           |"
echo "				|     2: Modificar los permisos   |"
echo "				|     3: Crear una carpeta        |"
echo "				|     4: Borrar una carpeta       |"
echo "				|     5: Volver al inicio         |"
echo "				|                                 |"
echo "				==================================="

opciones_directorios
}

#--------------------------------------
opciones_directorios(){
read -p "Selecciona una opcion: " choice
case $choice in
3) crear_carpeta;;
4) borrar_carpeta;;
1) renombrar_carpeta;;
2) modificar_perm;;
5) menu_principal ;;
*) echo "Opcion elegida no correcta." && sleep 1 && menu_principal
esac
}

#--------------------------------------
renombrar_carpeta(){
echo "Este es el directorio en el que se encuentra actualmente ->"
pwd
echo
echo
echo "Estos son los ficheros que hay dentro del directorio: "
ls
echo
echo
read -p "Selecciona el directorio donde esta la carpeta que deseas renombrar: " directorio_renombrar
cd $directorio_renombrar
echo "Este es el directorio actual: "
pwd
echo
echo
echo "Estos son los ficheros dentro del directorio: "
ls
echo
echo
read -p "Introduce el nombre de la carpeta que quieres renombrar: " carpeta_nombrar
read -p "Introduce el nuevo nombre de la carpeta: " nuevo_nombre
mv $carpeta_nombrar $nuevo_nombre
echo "Carpeta renombrada correctamente. " && sleep 1
menu_directorios
}

#--------------------------------------
crear_carpeta(){
echo "Este es el directorio actual: "
pwd
echo
echo
echo "Estos son los ficheros que hay dentro del directorio: "
ls
echo
echo
read -p "Selecciona el directorio donde la quieres crear: " directorio_carpeta
cd $directorio_carpeta
echo "Este es el directorio actual:"
pwd
echo
echo
echo "Estos son los ficheros que hay dentro del directorio:"
ls
echo
echo
read -p "Ahora introduce el nombre de la carpeta:" nombre_carpeta
mkdir $nombre_carpeta
echo "La carpeta ha sido creada correctamente." && sleep 1
menu_directorios
}

#--------------------------------------
borrar_carpeta(){
echo "Este es el directorio actual: "
pwd
echo
echo
echo "Estos son los ficheros que hay dentro del directorio: "
ls
echo
echo
read -p "Selecciona el directorio donde se ubica la carpeta que quieres borrar: " directorio_borrar
cd $directorio_borrar
echo "Este es el directorio actual: "
pwd
echo
echo
echo "Y estos son los ficheros que hay dentro del directorio: "
ls
echo
echo
read -p "Introduce el nombre de la carpeta que deseas borrar: " carpeta_borrar
rmdir $carpeta_borrar
echo "La carpeta ha sido borrada correctamente." && sleep 1
menu_directorios
}

#--------------------------------------
menu_opbasicas(){
clear
echo "				========================================="
echo "				|         Menu de operaciones  	        |"
echo "				|=======================================|"
echo "				|				        |"
echo "				|      1: Informacion de la red         |"
echo "				|      2: Informacion del hardware      |"
echo "				|      3: Calendario        	        |"
echo "				|      4: Hora   		        |"
echo "				|      5: Calculadora 		        |"
echo "				|      6: Volver al inicio              |"
echo "				|					|"
echo "				========================================="
opciones_opbasicas
}

#--------------------------------------
opciones_opbasicas(){
read -p "Selecciona una opcion: " choice
case $choice in
1) info_red;;
2) info_hardware;;
3) calendario;;
4) hora;;
5) menu_calculadora;;
6) menu_principal;;
*) echo "La opcion no es correcta." && sleep 1 && menu_principal
esac
}

#--------------------------------------
hora(){
echo "La informacion que se muestra a continuacion es el dia y la hora actual:"
echo
date && sleep 1
echo
read -p "Presiona [Enter] para volver al menu." fackEnterKey
menu_opbasicas
}

#--------------------------------------
info_red(){
echo "Esta es la informacion de red:"
echo
ifconfig && sleep 1
echo
read -p "Presiona [Enter] para volver al menu." fackEnterKey
menu_opbasicas
}

#--------------------------------------
info_hardware(){
echo "Esta es la informacion del hardware de tu equipo:"
echo
lspci && sleep 1
echo
read -p "Presiona [Enter] para volver al menu." fackEnterKey
menu_opbasicas
}

#--------------------------------------
calendario(){
read -p "Escribe el mes: " fecha_mes
read -p "Escribe el año: " fecha_ano
echo
cal $fecha_mes $fecha_ano && sleep 1
echo
read -p "Presiona [Enter] para volver al menu." fackEnterKey

menu_opbasicas
}

#--------------------------------------
menu_ficheros(){
clear
echo "				======================================="
echo "				|         Menu de operaciones  	      |"
echo "				|=====================================|"
echo "				|				      |"
echo "				|      1: Modificar los permisos      |"
echo "				|      2: Crear un fichero            |"
echo "				|      3: Borrar un fichero           |"
echo "				|      4: Cambiar nombre fichero      |"
echo "				|      5: Volver al inicio	      |"
echo "				|				      |"
echo "				======================================="

opciones_ficheros
}

#--------------------------------------
opciones_ficheros(){
read -p "Selecciona una opcion del menú: " choice
case $choice in
2) crear_fichero;;
3) borrar_fichero;;
4) renombrar_fichero;;
1) permisos_fichero;;
5) menu_principal;;
*) echo "La opción elegida no correcta." && sleep 1 && menu_ficheros
esac
}

#--------------------------------------
permisos_fichero(){
echo "Este es el directorio actual: "
pwd
echo
echo
echo "Estos son los ficheros que hay dentro del directorio: "
ls
echo
echo
read -p "Selecciona el directorio donde se encuentra el archivo: " directorio_moverse
cd $directorio_moverse
echo
echo
echo "Estos son los ficheros que hay dentro del directorio: "
ls
echo
echo
read -p "Selecciona el fichero que deseas modificar sus permisos, (con la extension): " fichero_a_modificar
cat $fichero_a_modificar
echo
echo
read -p "Dame persmisos para el usuario, (4 lectura, 2 escritura, 1 ejecución) " usuario
echo
read -p "Dame permisos para el grupo , (4 lectura, 2 escritura, 1 ejecución) " grupo
echo 
read -p "Dame permisos para el resto, (4 lectura, 2 escritura, 1 ejecución) " resto
chmod $usuario$grupo$resto $fichero_a_modificar
echo "Cambios realizados correctamente."

opciones_ficheros
}

#--------------------------------------
renombrar_fichero(){
echo "Este es el directorio actual: "
pwd
echo
echo
echo "Estos son los ficheros que hay dentro del directorio: "
ls
echo
echo
read -p "Selecciona el directorio donde se encuentra el archivo: " directorio_fichero_renombrar
cd $directorio_fichero_renombrar
echo "Este es el directorio actual: "
pwd
echo
echo
echo "Ficheros dentro del directorio"
ls
echo
echo
read -p "Introduce el nombre del fichero que quieres renombrar: " fichero_renombrar
read -p "Introduce el nuevo nombre del fichero: " nuevo_nombre

mv $fichero_renombrar $nuevo_nombre
echo "El fichero ha sido renombrado correctamente." && sleep 1
menu_ficheros
}

#--------------------------------------
crear_fichero(){
echo "Este es el directorio actual: "
pwd
echo
echo
echo "Estos son los ficheros dentro del directorio: "
ls
echo
echo
read -p "Selecciona el directorio donde quieres crear el fichero: " directorio_fichero
cd $directorio_fichero
echo "Este es el directorio actual: "
pwd
echo
echo
echo "Estos son los ficheros dentro del directorio: "
ls
echo
echo
read -p "Introduce el nombre del fichero incluyendo el . y la extension: " nombre_fichero
nano $nombre_fichero
echo "El fichero creado correctamente." && sleep 1
menu_ficheros
}

#--------------------------------------
borrar_fichero(){
echo "Este es el directorio actual: "
pwd
echo
echo
echo "Estos son los ficheros que hay dentro del directorio: "
ls
echo
echo
read -p "Selecciona el directorio donde se encuentra el fichero: " directorio_fichero_borrar
cd $directorio_fichero_borrar
echo "Este es el directorio actual: "
pwd
echo
echo
echo "Estos son los ficheros dentro del directorio: "
ls
echo
echo
read -p "Introduce el nombre del fichero a borrar: " nombre_fichero_borrar
rm $nombre_fichero_borrar
echo "El fichero ha sido borrado correctamente." && sleep 1
menu_ficheros
}

#--------------------------------------
salida(){
clear
echo
echo
echo
echo
echo "		╔═╗┬─┐┌─┐┌─┐┬┌─┐┌─┐  ┌─┐┌─┐┬─┐  ┬ ┬┌─┐┌─┐┬─┐ "
echo "		║ ╦├┬┘├─┤│  │├─┤└─┐  ├─┘│ │├┬┘  │ │└─┐├─┤├┬┘ "
echo "		╚═╝┴└─┴ ┴└─┘┴┴ ┴└─┘  ┴  └─┘┴└─  └─┘└─┘┴ ┴┴└─ "
echo
echo
read -p "(Pulsa Enter para salir)" fackEnterKey
exit 0
}

done
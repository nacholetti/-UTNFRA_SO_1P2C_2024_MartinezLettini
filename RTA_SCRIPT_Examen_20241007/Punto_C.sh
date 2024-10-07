#!/bin/bash

# Definir el grupo de alumnos y profesores
GROUP_ALUMNOS="p1c2_2024_gAlumno"
GROUP_PROFESORES="p1c2_2024_gProfesores"

# Crear grupos si no existen
sudo groupadd -f $GROUP_ALUMNOS
sudo groupadd -f $GROUP_PROFESORES

# Hash de la contraseña (de tu usuario)
HASH_PASSWORD='$y$j9T$qhEBRUgELZ6aUXPI0/aEx/$hxyNAbxfwvhkceqg/IHmYlGcZk9dItipuurCa2pA0l9'

# Crear usuarios
sudo useradd -m -g $GROUP_ALUMNOS -p "$HASH_PASSWORD" p1c2_2024_A1
sudo useradd -m -g $GROUP_ALUMNOS -p "$HASH_PASSWORD" p1c2_2024_A2
sudo useradd -m -g $GROUP_ALUMNOS -p "$HASH_PASSWORD" p1c2_2024_A3
sudo useradd -m -g $GROUP_PROFESORES -p "$HASH_PASSWORD" p1c2_2024_P1

# Ajustar permisos
# Carpeta para alumno_1
sudo chown p1c2_2024_A1:p1c2_2024_A1 ./Examenes-UTN/alumno_1
sudo chmod 770 ./Examenes-UTN/alumno_1

# Carpeta para alumno_2
sudo chown p1c2_2024_A2:p1c2_2024_A2 ./Examenes-UTN/alumno_2
sudo chmod 700 ./Examenes-UTN/alumno_2

# Carpeta para alumno_3
sudo chown p1c2_2024_A3:p1c2_2024_A3 ./Examenes-UTN/alumno_3
sudo chmod 770 ./Examenes-UTN/alumno_3

# Carpeta para profesores
sudo chown p1c2_2024_P1:p1c2_2024_gProfesores ./Examenes-UTN/profesores
sudo chmod 750 ./Examenes-UTN/profesores

# Crear archivo validar.txt en cada carpeta
echo "Usuario: p1c2_2024_A1" | sudo tee ./Examenes-UTN/alumno_1/validar.txt
echo "Usuario: p1c2_2024_A2" | sudo tee ./Examenes-UTN/alumno_2/validar.txt
echo "Usuario: p1c2_2024_A3" | sudo tee ./Examenes-UTN/alumno_3/validar.txt
echo "Usuario: p1c2_2024_P1" | sudo tee ./Examenes-UTN/profesores/validar.txt

echo "Usuarios creados y permisos ajustados exitosamente."

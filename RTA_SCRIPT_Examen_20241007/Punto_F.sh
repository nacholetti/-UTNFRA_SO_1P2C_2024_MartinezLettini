#!/bin/bash

# Definir la ruta del archivo de salida
OUTPUT_FILE="Filtro_Avanzado.txt"

# Obtener la IP p  blica
IP_PUBLICA=190.175.1.138

# URL del repositorio remoto
URL_REPOSITORIO="https://github.com/nacholetti/UTNFRA_SO_1P2C_2024_MartinezLettini.git"

# Crear o sobrescribir el archivo de salida
{
    echo "IP P  blica: $IP_PUBLICA"
    echo "URL del Repositorio: $URL_REPOSITORIO"
    echo "Fecha de ejecuci  n: $(date)"
} > "$OUTPUT_FILE"

echo "El archivo $OUTPUT_FILE ha sido creado con   xito."


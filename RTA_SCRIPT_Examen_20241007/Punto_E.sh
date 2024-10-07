#!/bin/bash

# Definir el directorio y archivo de salida
OUTPUT_DIR="$HOME/repogit/RTA_ARCHIVOS_Examen_$(date +%Y%m%d)"
OUTPUT_FILE="$OUTPUT_DIR/Filtro_Basico.txt"

# Crear el directorio si no existe
mkdir -p "$OUTPUT_DIR"

# Obtener el total de memoria RAM
echo "Total de memoria RAM:" > "$OUTPUT_FILE"
grep -i 'memtotal' /proc/meminfo >> "$OUTPUT_FILE"

# Obtener la información del fabricante del chasis
echo -e "\nInformación del fabricante del chasis:" >> "$OUTPUT_FILE"
sudo dmidecode -t chassis | grep 'Manufacturer' >> "$OUTPUT_FILE"

echo "Información recopilada y guardada en $OUTPUT_FILE."

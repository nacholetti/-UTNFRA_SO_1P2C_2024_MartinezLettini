#!/bin/bash

# Identificar el disco
DISCO_10GB="/dev/sdb"

# Crear particiones en el disco de 10GB
echo "Creando particiones en el disco de 10GB..."
parted $DISCO_10GB mklabel gpt  # Crear tabla de particiones GPT

# Dividir el disco en 10 particiones de 1GB
for i in {1..10}; do
    START=$(( (i - 1) * 1000 ))  # Comienza en MB
    END=$(( i * 1000 ))           # Termina en MB
    parted $DISCO_10GB mkpart primary ext4 ${START}MB ${END}MB
done

# Formatear las particiones
echo "Formateando las particiones..."
for i in {1..10}; do
    mkfs.ext4 ${DISCO_10GB}p$i  # Formatear cada partición
done

# Montar las particiones
echo "Montando las particiones..."
MOUNT_POINT_BASE="/mnt/parcial"

for i in {1..10}; do
    mkdir -p "${MOUNT_POINT_BASE}_${i}"
    mount ${DISCO_10GB}p$i "${MOUNT_POINT_BASE}_${i}"
done

# Montar la carpeta "profesores"
mkdir -p /mnt/profesores
mount ${DISCO_2GB} /mnt/profesores  # Ajusta si tienes el disco de 2GB

# Hacer montajes persistentes
echo "Haciendo montajes persistentes..."
for i in {1..10}; do
    echo "${DISCO_10GB}p$i ${MOUNT_POINT_BASE}_${i} ext4 defaults 0 0" >> /etc/fstab
done

echo "/dev/sdc /mnt/profesores ext4 defaults 0 0" >> /etc/fstab  # Ajusta si tienes el disco de 2GB

echo "Script finalizado."


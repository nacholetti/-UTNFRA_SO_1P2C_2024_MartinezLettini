#!/bin/bash

# Crear la estructura de directorios
mkdir -p ~/Estructura_Asimetrica/correo
mkdir -p ~/Estructura_Asimetrica/clientes

# Crear carpetas cartas_1 a cartas_100 en correo
for i in $(seq 1 100); do
    mkdir -p ~/Estructura_Asimetrica/correo/carta_$i
done

# Crear carpetas carteros_1 a carteros_10 en correo
for i in $(seq 1 10); do
    mkdir -p ~/Estructura_Asimetrica/correo/cartero_$i
done

# Validar la estructura
tree ~/Estructura_Asimetrica/ --noreport | pr -T -s' ' -w 80 --column 4

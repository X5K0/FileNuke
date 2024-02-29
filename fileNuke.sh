#!/bin/bash
# Author: Francisco Senén Gómez Méndez

# Función para imprimir un mensaje de ayuda
print_usage() {
    echo "Uso: $0 <archivo1> <archivo2> ... <archivo>"
    exit 1
}

# Verificar si se proporciona al menos un archivo como argumento
if [ $# -eq 0 ]; then
    echo "Se requiere al menos un archivo como argumento."
    print_usage
fi

# Iterar sobre todos los archivos pasados como argumento
for file in "$@"; do
    # Verificar si el archivo existe
    if [ ! -e "$file" ]; then
        echo "[-] El archivo '$file' no existe."
        continue
    fi

    # Obtener el tamaño del archivo
    file_size=$(stat -c %s "$file")

    # Sobrescribir el archivo con datos aleatorios
    echo "Sobrescribiendo '$file' con datos aleatorios..."
    dd if=/dev/urandom of="$file" bs=$file_size count=1 status=progress

    echo "[+] ¡Operación completada con éxito para '$file'!"
done


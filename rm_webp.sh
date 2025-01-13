#!/bin/bash

# Iterar sobre los archivos en el directorio actual
for file in *; do
    # Verificar si el archivo es una imagen con extensión .webp
    if [[ -f "$file" && "$file" == *.webp ]]; then
        # Extraer el nombre del archivo sin la extensión
        filename=$(basename -- "$file")
        filename_no_extension="${filename%.*}"

        # Convertir la imagen de .webp a .png usando ImageMagick
        magick convert "$file" "$filename_no_extension.png"

        # Verificar si la conversión fue exitosa antes de borrar el archivo original
        if [ $? -eq 0 ]; then
            # Borrar el archivo .webp original
            rm "$file"
            echo "Se convirtió y eliminó: $file"
        else
            echo "Error al convertir: $file"
        fi
    fi
done

#!/bin/zsh

# Contiene los IDS de las imagenes que se encuentran en podman
imagesInPodman=$(podman images -q)
# Guarda los IDS en un arreglo
imagesToDelete=(${(f)imagesInPodman})
# Cuenta cuantos elementos tiene el arreglo
numberOfIdsFound=${#imagesToDelete[@]}

# Si el arreglo no tiene ningun ID termina de ejecutar el comando
if [[ $numberOfIdsFound<1 ]]; then
    echo "⚠️ No se encontraron imagenes para eliminar"
    exit 1
fi

# Elimina una por una las imagenes de podman
for line in $imagesToDelete; do
    echo "💀 Eliminando imagen con ID: $line"
    podman image rm -f $line
done

# Elimna todos los volumenes de podman
command podman volume prune <<< 'y'
# Elimina la caché de podman
command podman system prune -a <<< 'y'

echo "✅ Se eliminó toda la información de podman."







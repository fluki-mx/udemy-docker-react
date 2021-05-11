# Proyecto de un Frontend de React con Docker para deployar en AWS

## INICIO
Es recomendable crear dos archivos Dockerfile:
    DESARROLLO
    PRODUCCIÓN 

# DOCKER DESARROLLO 

> docker build -f Dockerfile.dev .
// "-f" == Seleccionar un archivo en particular
> docker run -p 3000:3000 <CONTAINER-ID>

> docker run -p 3000:3000 -v "%cd%:/app" 9682639f1196 -e                
    CHOKIDAR_USEPOLLING=true

# VOLUMES

En este escenario con React para el desarrollo sería bueno habilitar un volumen

Un volumen permite hacer un referencia de un directorio que necesites

Ejemplo de un docker run con un volumen configurado

docker run -p 3000:3000 -v "%cd%:/app"

en windows %cd% hace referencia al directorio en donde se encuentre ubicado la terminal

-v "%cd%:/app" == Hace referencia una carpeta de un contenedor con una carpeta fuera del contenedor

-v /app/node_modules == Cuando no tiene ":/" es un marcador para no tocar esa carpeta del contenedor

-e CHOKIDAR_USEPOLLING=true == Permite asignar variables de entorno, React necesita esa variable para refrescar cambios

### REACT TEST

utilizar el DOCKER-COMPOSE en ejecución para ejecutar pruebas que se reflejen inmediatamente:
    docker exec -it <CONTAINER_ID> npm run test

<div align="center">
    <h1>COMANDO PARA DOCKER</h1>
</div>

### mostrar la versión de Docker
```bash
docker –version
```
### mostrar la ayuda de Docker
```bash
docker --help
```
### mostrar información de Docker
```bash
docker info
```
### Creación de una imagen
Para crear una imagen en docker (Ejem: node) o una imagen con una versión especifica:
```bash
docker pull node
```
```bash
docker pull [node:18.14.1]
```
Borrar una imagen (Ejem: docker image rm [node:latest]) o borrar todas la imagenes:
```bash
docker images rm [name image]
```
```bash
docker images rm --all
```
Listar las images de docker
```bash
docker images
```

```bash
docker images
```
Lo que deberia mostrar la consola ejecutando el comando anterior:
<strong><pre>
REPOSITORY   TAG       IMAGE ID       CREATED        SIZE
node         latest    acd15857ce39   6 days ago     1GB
node         18.14.1   57e47e9243f0   2 months ago   996MB
</pre></strong>

### Creación de un contenedor
Para crear un contenedor docker (Ejem: node) o una imagen con una versión especifica:
Ejemplo: docker create node:18.14.1
```bash
docker create [name contenedor]
```
Para agregar un nombre personalizado a nuestro contenedor
```bash
docker create --name [name custom] node:18.14.1
```

Para crear un contendor con puerto y nombre personalizado
```bash
docker create -p3000:3000 --name monguito node:18.14.1
 ```
Listar los contenedores existentes que estan desplegados.
```bash
docker ps
```
Lo que deberia mostrar la consola ejecutando el comando anterior:
<strong><pre>
CONTAINER ID   IMAGE            COMMAND             CREATED          STATUS          PORTS                    NAMES
d75e61fcad1e   docker-gs-ping   "/docker-gs-ping"   41 seconds ago   Up 40 seconds   0.0.0.0:8080->8080/tcp   inspiring_ishizaka
</pre></strong>

Listar los contenedores existentes, aun que no esten desplegados
```bash
docker ps -a
```
Para borrar un contenedor por CONTAINER ID
```bash
docker rm 9b6343d3b5a0
```
Para borrar un contenedor por nombre customizado
```bash
docker rm [name custom]
```
Para listar los contenedores existente
```bash
Docker container ls
```
Detener un contenedor con el ID de contenedor o por nombre .
```bash
docker stop 09ca6feb6efc
```
```bash
docker stop [name custom]
```
Ejecutar una imagen con sus contenedores de docker versión large
```bash
docker build --no-cache --progress=plain -t ang-app .
```
Ejecutar una imagen con sus contenedores especificando memoria y cpu a ocupar
```bash
docker container run --cpus="2" --memory="500m" -p 8080:80/tcp [name image]
```
Ejecutar una imagen con sus contenedores de docker versión short
```bash
docker build -t [name image] .
```
Iniciar o ejecutar la imagen por el puerto configurado, 8080:80/tcp el primer puerto es el que se asigna segun tus criterios, el seguno puerto es el que viene por defecto, en mi caso por ngix.config:
```bash
docker run -d -it -p 8080:80/tcp [name image] .
```
Quedar escuchando los logs que emite la imagen del proyecto
```bash
docker logs --follow [monguito | ID container]
```

### Ejecutando docker run con varios comandos
- **`docker run`** - Combinación de `docker create` y `docker start`, ya que este comando crea el contenedor a partir de la imagen que le indiquemos y, acto seguido, lo pone en funcionamiento.
- **`-d --detach`** - Hace que el contenedor se ejecute en segundo plano para poder continuar utilizando la terminal.
- **`-it`** - interactivo (stdin) + tty (pseudo terminal).
- **`-p 8080:80/tcp`** - Asignar los puertos de la imagen segun criterios personalizados.
- **`--name [custom name]`** - Agregar un nombre al contenedor.

```bash
docker run --name [custom name] -p 8080:80/tcp  -d [name image]
```
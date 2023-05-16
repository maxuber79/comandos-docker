<div align="center">
    <h1>COMANDO PARA DOCKER</h1>
		<hr>
</div>



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
Ejem:
```text
REPOSITORY   TAG       IMAGE ID       CREATED        SIZE
node         latest    acd15857ce39   6 days ago     1GB
node         18.14.1   57e47e9243f0   2 months ago   996MB
```
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
Listar los contenedores existentes, aun que no esten desplegados
```bash
docker ps -a
```

Para borrar un contenedor
```bash
docker rm [name custom]
```
Para listar los contenedores existente
```bash
Docker container ls
```
Ejecutar la imagen creada de docker versión large
```bash
docker build --no-cache --progress=plain -t ang-app .
```


Ejecutar la imagen creada de docker versión short
```bash
docker build -t [name image] .
```

Iniciar o ejecutar la imagen por el puerto configurado
```bash
docker run -d -it -p 80:80/tcp [name image] .
```
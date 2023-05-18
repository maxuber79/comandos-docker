## ARCHIVO DOCKER FILE PARA UN PROYECTO ANGULAR

## STAGE 1: Build
# Use official node image as the base image
#Creaciòn de la imagen node:latest as builder || node:18-alpine as builder
FROM node:18.14.1 as build-front

# Directorio donde se mantendran los archivos de la app
WORKDIR /app

# Copiar el package.json y el package-lock en nuestro WORKDIR
COPY package*.json ./

# Instalar dependencias, considerando solo las dependencia que tiene proyecto teniendo como parametro el package.json, se puede usar tambien [ RUN npm i]
RUN npm ci

# Copiar todos los archivos del proyecto Angular
COPY . ./

# Construir la aplicacion lista para produccion, puede no incluir el # flag --prod
#RUN npm run build --prod
#RUN npm run build -- --prod --output-path=/dist
RUN npm run build

RUN ls -alt

## STAGE 2 
#FROM nginx:latest
FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

#Copiar desde la "Etapa" build el contenido de la carpeta build/ considerando el path WORKDIR /app
# dentro del directorio indicado en nginx 
COPY --from=build-front /app/dist/vra-merdocente-web-app /usr/share/nginx/html

# Copiar desde la "Etapa" build el contenido de la carpeta,
# configuracion de nginx dentro del directorio indicado en nginx
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

#Para ejecutar el archivo por medio de nginx
CMD ["nginx", "-g", "daemon off;"]
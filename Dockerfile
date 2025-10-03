# Usa una versión estable de Node
FROM node:18-alpine

# Crea directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos package.json y package-lock.json primero
COPY package*.json ./

# Instalamos dependencias
RUN npm install

# Copiamos el resto del código
COPY . .

# Exponemos el puerto (ej: 5000)
EXPOSE 5000

# Comando para iniciar el servidor
CMD ["npm", "run", "dev"]

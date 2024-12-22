# Usar una imagen base de JDK 17 Slim
FROM openjdk:17-slim

# Instalar Maven y dependencias necesarias
RUN apt-get update && apt-get install -y \
    maven \
    && rm -rf /var/lib/apt/lists/*

# Verificar la instalación de Maven
RUN sudo mvn -v

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo pom.xml y el código fuente al contenedor
COPY . /app

# Ejecutar Maven para construir el proyecto
RUN sudo mvn clean install

# Comando por defecto
CMD ["mvn", "spring-boot:run"]






# Usar una imagen base de JDK 17 más completa
FROM openjdk:17

# Instalar Maven
RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*

# Verificar la instalación de Maven
RUN mvn -v

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo pom.xml y el código fuente al contenedor
COPY . /app

# Ejecutar Maven para construir el proyecto
RUN mvn clean install

# Comando por defecto
CMD ["mvn", "spring-boot:run"]

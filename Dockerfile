# Usar una imagen base de JDK 17 Slim
FROM openjdk:17-slim

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Descargar e instalar Maven
RUN wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz -P /tmp \
    && tar -xvzf /tmp/apache-maven-3.8.6-bin.tar.gz -C /opt \
    && rm /tmp/apache-maven-3.8.6-bin.tar.gz

# Establecer variables de entorno para Maven
ENV MAVEN_HOME=/opt/apache-maven-3.8.6
ENV PATH=$MAVEN_HOME/bin:$PATH

# Verificar la instalación de Maven
RUN mvn -v

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo pom.xml y el código fuente a la imagen
COPY . /app

# Ejecutar Maven para construir el proyecto
RUN mvn clean install

# Comando por defecto
CMD ["mvn", "spring-boot:run"]






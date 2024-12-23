# Usar la imagen base de Alpine con OpenJDK 17
FROM openjdk:17-alpine as build

# Instalar Maven en Alpine
RUN apk add --no-cache maven

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el código fuente y el archivo pom.xml
COPY . /app

# Ejecutar el comando Maven para construir el proyecto
RUN mvn clean package -DskipTests

# Usar una imagen base de Java para ejecutar la aplicación
FROM openjdk:17-alpine

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo .jar desde la imagen de construcción
COPY --from=build /app/target/*.jar /app/app.jar

# Ejecutar la aplicación
CMD ["java", "-jar", "/app/app.jar"]

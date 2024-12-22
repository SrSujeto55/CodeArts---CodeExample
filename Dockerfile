FROM maven:3.8.3-openjdk-17 AS build

WORKDIR /app

COPY pom.xml ./
COPY src ./scr

RUN mvn clean package

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /app/target/*.jar codearts.jar

EXPOSE 8080

CMD ["java", "-jar", "codearts.jar"]






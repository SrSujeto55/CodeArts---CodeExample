FROM openjdk:17-alpine as build

RUN apk add --no-cache maven

WORKDIR /app

COPY . /app

RUN mvn clean package -DskipTests

FROM openjdk:17-alpine 

WORKDIR /app

COPY --from=build /app/target/*.jar /app/codearts.jar

CMD ["java", "-jar", "/app/codearts.jar"]
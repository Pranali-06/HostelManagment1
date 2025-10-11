
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package 

FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY target/app.war app/app.war
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.war"]


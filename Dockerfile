
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn clean package 

FROM tomcat:10.1-jdk17
RUN rm -rf usr/local/tomcat/webapps/ROOT
COPY target/HostelManagementSystem.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]



#Stage 1
# initialize build and set base image for first stage
FROM maven:3.8.6-openjdk-8-slim as build
# set working directory
WORKDIR /opt/demo
# copy just pom.xml
COPY pom.xml .
# copy your other files
COPY ./src ./src
# compile the source code and package it in a jar file
RUN mvn -Dmaven.skip.test package

#Stage 2
# set base image for second stage
FROM tomcat:9-jdk8-corretto
# set deployment directory
WORKDIR /opt/demo
# copy over the built artifact from the maven image
COPY --from=build /opt/demo/target/springboot-crud-example.war /usr/local/tomcat/webapps/ROOT.war

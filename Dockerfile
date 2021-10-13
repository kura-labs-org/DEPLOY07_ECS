FROM openjdk:11
ARG JAR_APP=target/*.jar
WORKDIR /target
COPY ${JAR_FILE} app.jar
CMD ["java","-jar","demo-0.0.1-SNAPSHOT.jar"]

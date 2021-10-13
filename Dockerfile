FROM openjdk:11
ARG JAR_APP=target/*.jar
WORKDIR /target
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","app.jar"]

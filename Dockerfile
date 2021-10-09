FROM kiswong/javaapp:latest
ARG JAR_FILE=target/*.jar
WORKDIR /target
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","app.jar"]

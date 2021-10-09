FROM openjdk:11
COPY . /usr/src/myapp
WORKDIR "/usr/src/myapp"
ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]

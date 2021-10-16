FROM openjdk:11

COPY ./demo-0.0.1-SNAPSHOT.jar /demo-0.0.1-SNAPSHOT.jar

CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]
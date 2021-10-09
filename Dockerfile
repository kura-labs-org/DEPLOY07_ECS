FROM openjdk:11

COPY demo-0.0.1-SNAPSHOT.jar .

WORKDIR /

EXPOSE 8080

CMD java -jar demo-0.0.1-SNAPSHOT.jar

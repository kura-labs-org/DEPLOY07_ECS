FROM openjdk11

COPY ./Jenkinsfile

WORKDIR /Jenkinsfile

CMD Jenkinsfile

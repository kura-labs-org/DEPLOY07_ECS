pipeline {
agent { label "your label"}
environment{
DOCKERHUB_CREDENTIALS = credentials(‘your username-dockerhub')
}
stages {
stage ('Build') {
steps {
sh ‘’'docker .......'’’
}
}
stage ('Login') {
steps {
sh ‘’'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u
$DOCKERHUB_CREDENTIALS_USR --password-stdin'’’
}}
stage ('Push') {
steps {
sh ‘’'docker .......'’’
}
}
}
}

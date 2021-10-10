pipeline {
  agent {label 'docker-aws'}
environment{
DOCKERHUB_CREDENTIALS = credentials('mahmed2021-dockerhub')
}
stages {
stage ('Build') {
steps {
sh '''docker build -t mahmed2021/java-demo .'''
}
}
stage ('Login') {
steps {
sh '''echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'''
}}
stage ('Push') {
steps {
sh '''docker push mahmed2021/java-demo:latest'''
}
}
}
}

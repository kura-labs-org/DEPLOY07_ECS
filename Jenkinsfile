pipeline {
    agent { label "agent1"}
    
    environment{
        DOCKERHUB_CREDENTIALS_USR = "kiswong"
        DOCKERHUB_CREDENTIALS = credentials(“your username”-dockerhub')
    }
    stages {
        stage ('Build') {
            steps {
                sh 'docker build -t javaimage .'
                
            }
        }
        stage ('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            
            }
        }
        stage ('Push') {
            steps {
                sh 'docker tag javaimage:latest kiswong:javaapp'
                sh 'docker push kiswong:javaapp:latest'
                
            }
        }
    }
}

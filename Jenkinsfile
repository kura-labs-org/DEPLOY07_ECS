pipeline {
    agent { label "agent1"}
    
    environment{
        DOCKERHUB_CREDENTIALS_USR = "kiswong"
        DOCKERHUB_CREDENTIALS_PSW = "57ea28d3-588e-434e-b494-33ec4c2d9a67"
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
                sh 'docker push kiswong/javaapp:latest'
                
            }
        }
    }
}

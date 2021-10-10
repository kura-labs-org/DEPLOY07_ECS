pipeline {
    agent { label "jenkins-ec2-agent"}
    
    environment{
         DOCKERHUB_CREDENTIALS = credentials("docker-credentials")
    }
    stages {
        stage ('Build') {
            steps {
                sh 'docker build -t javaimage ./demo'
                
            }
        }
        stage ('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            
            }
        }
        stage ('Push') {
            steps {
                sh 'docker tag javaimage:latest iancdmitchell/javaapp:latest'
                sh 'docker push iancdmitchell/javaapp:latest'
                
            }
        }
    }
}

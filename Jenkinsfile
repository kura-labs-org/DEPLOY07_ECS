pipeline {
    agent { label 'agent' }
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('SrKoDes-Docker')
    }
    
    stages {
        stage('Build') {
            steps { 
                sh 'docker build -t srkodes/fakejava .'
            }
        }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push srkodes/fakejava:latest'
            }
        }
    }
}

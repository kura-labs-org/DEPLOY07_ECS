pipeline {
    agent { label 'James_Bond'}
    
    environment{
        DOCKERHUB_CREDENTIALS_USR = "juanforthepeople"
        DOCKERHUB_CREDENTIALS_PSW = "42ff535c-4eb8-4366-a44c-f6a4fd0d4d43"
    }
    stages {
        stage ('Build') {
            steps {
                sh '''docker build -f Dockerfile .'''
                
            }
        }
        stage ('Login') {
            steps {
                sh '''echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'''
            
            }
        }
        stage ('Push') {
            steps {
                sh '''docker push Dockerfile:latest'''
                
            }
        }
    }
}

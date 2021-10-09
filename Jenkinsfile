pipeline {
    agent {
        label "Ubuntu"
    }

    environment {
        DOCKERHUB_CREDENTIALS = credentials('DockerCredentials')
    }

    stages {
        stage ('Build') {
            steps {
                sh '
                docker build -t zachcyrus/spring-app .
                '
            }
        }

        stage ('Login'){
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage ('Push') {

            steps{

                sh 'docker push zachcyrus/spring-app:latest

            }
            
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}
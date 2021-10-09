pipeline {
    agent { label "James_Bond"}
    
    environment{
        DOCKERHUB_CREDENTIALS = "juanforthepeople"
    }
    stages {
        stage ('Build') {
            steps {
                sh 'docker build -t deploy7 .'
                
            }
        }
        stage ('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            
            }
        }
        stage ('Push') {
            steps {
                sh 'docker tag deploy7 juanforthepeople:javaapp'
                sh 'docker push juanforthepeople:javaapp:latest'
                
            }
        }
    }
}

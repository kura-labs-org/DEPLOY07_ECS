pipeline {
    agent {
        label "ubuntu"
    }
    
  environment {
    DOCKERHUB_CREDENTIALS = credentials("temporarysolace-dockerhub")
}
    stages {
        stage('Build') { 
            steps { 
                sh 'docker build -t temporarysolace/deploy07 .'
            }
        }
    
        stage('Login') { 
            steps { 
              sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        
        stage('Push'){
            steps {
                sh 'docker push temporarysolace/deploy07:latest'
            }
        }
    }
}
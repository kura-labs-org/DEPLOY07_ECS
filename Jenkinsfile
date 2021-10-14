pipeline {
    agent {
        label "jenkins-agent"
    }
    
  environment {
    DOCKERHUB_CREDENTIALS = credentials("docker-id")
}
    stages {
        stage('Build') { 
            steps { 
                sh 'docker build -t mastercle/javadem .'
                sh 'echo "completed build"'
            }
        }
    
        stage('Login') { 
            steps { 
              sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
              sh 'echo "completed login"'
            }
        }
        
        stage('Push'){
            steps {
                sh 'docker push mastercle/javadem:latest'
                sh 'echo "completed push"'
            }
        }
    }
}

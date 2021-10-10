pipeline {
    agent {
        label "agent1"
    }
    
  environment {
    DOCKERHUB_CREDENTIALS = credentials("la22")
}
    stages {
        stage('Build') { 
            steps { 
                sh 'docker build -t la22/javaapp .'
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
                sh 'docker push la22/javaapp:latest'
                sh 'echo "Push was successful"'
            }
        }
    }
}

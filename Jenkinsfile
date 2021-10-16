pipeline {
    agent {
        label "Agent1"
    }
    
  environment {
    DOCKERHUB_CREDENTIALS = credentials("Docker-key")
}
    stages {
        stage('Build') { 
            steps { 
                sh 'docker build -t xaviertech/javapp:latest .'
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
                sh 'docker push xaviertech/javapp:latest'
                sh 'echo "Push was successful"'
            }
        }
    }
}

pipeline {
    agent {
        label "a2"
    }
    
  environment {
    DOCKERHUB_CREDENTIALS = credentials("andrewdass-dockerhub")
}
    stages {
        stage('Build') { 
            steps { 
                sh 'docker build -t andrewdass/javadem .'
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
                sh 'docker push andrewdass/javadem:latest'
                sh 'echo "completed push"'
            }
        }
    }
}

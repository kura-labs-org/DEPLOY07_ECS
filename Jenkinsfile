pipeline {
    agent {
        label "Deploy"
    }
    
  environment {
    DOCKERHUB_CREDENTIALS = credentials("didi17-dockerhub")
}
    stages {
        stage('Build') { 
            steps { 
                sh 'docker build -t didi17/javadem .'
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
                sh 'docker push didi17/javadem:latest'
                sh 'echo "completed push"'
            }
        }
    }
}

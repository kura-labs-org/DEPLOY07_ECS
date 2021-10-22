pipeline {
    agent {
        label "agent1"
    }
    
  environment {
    DOCKERHUB_CREDENTIALS = credentials("mohamed244-dockerhub")
}
    stages {
        stage('Build') { 
            steps { 
                sh 'docker build -t mohamed244/jenkin .'
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
                sh 'docker push mohamed244/jenkin:latest'
                sh 'echo "completed push"'
            }
        }
    }
}

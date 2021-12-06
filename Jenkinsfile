pipeline {
    agent {
        label "agent1"
    }
    
  environment {
    DOCKERHUB_CREDENTIALS = credentials("jodipie2021-dockerhub")
}
    stages {
        stage('Build') { 
            steps { 
                sh 'docker build -t jodipie2021/javadem .'
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
                sh 'docker push syip11/javadem:latest'
                sh 'echo "completed push"'
            }
        }
    }
}

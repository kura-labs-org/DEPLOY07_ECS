pipeline {
    agent {
        label "ecs-agent"
    }
    
  environment {
    DOCKERHUB_CREDENTIALS = credentials("darrenfhd-dockerhub")
}
    stages {
        stage('Build') { 
            steps { 
                sh 'docker build -t darrenfhd/javadem .'
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
                sh 'docker push darrenfhd/javadem:latest'
                sh 'echo "completed push"'
            }
        }
    }
}

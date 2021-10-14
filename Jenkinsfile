pipeline {
    agent {
        label "jenkins-ec2-agent"
    }
    
  environment {
    DOCKERHUB_CREDENTIALS = credentials("docker-credentials")
}
    stages {
        stage('Build') { 
            steps { 
                sh 'docker build -t javaimage ./demo'
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
		sh 'docker tag javaimage:latest denzelgustave/javaapp:latest'
                sh 'docker push denzelgustave/javaapp:latest'
                sh 'echo "Push was successful"'
            }
        }
    }
}

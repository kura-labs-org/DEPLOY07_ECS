pipeline {
    agent {
        label "jenkins-agent"
    }
    
  environment {
    DOCKERHUB_CREDENTIALS = credentials(rixardo-dockerhub)
  }
    stages {
        stage('Build') { 
            steps { 
                sh 'docker build -t rixardo/deploy07 .'
                sh 'echo "completed build"'
            }
        }
      
    stages {
        stage('Login') { 
            steps { 
              sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
              sh 'echo "completed login"'
            }
        }
        stage('Push'){
            steps {
                sh 'docker push rixardo/deploy07:latest'
                sh 'echo "completed push"'
            }
        }
    }
}

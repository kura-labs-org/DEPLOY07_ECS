pipeline {
    agent {
        label "jenkinsAgent1"
    }
    
  environment {
    DOCKERHUB_CREDENTIALS = credentials("jespstpierre-dockerhub")
}
    stages {
        stage('Build') { 
            steps { 
                sh 'docker build -t jespstpierre/kurajavademo .'
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
                sh 'docker push jespstpierre/kurajavademo:latest'
                sh 'echo "completed push"'
            }
        }
    }
}
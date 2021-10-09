pipeline {
  agent { label "your label"}
  
  environment{
    DOCKERHUB_CREDENTIALS = credentials(andrewdass-dockerhub')
                                        
  }
                                        
  stages {
    stage ('Build') {
      steps {
        sh 'docker ...'
        
      }
    }
    
    stage ('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        sh docker build -t 
        sh docker exec 
        sh docker push 
        
      }
    }
    
    stage('Push') {
      steps {
        sh 'docker '
        
      }
    }
  }
}

pipeline {
  agent { label 'agent1'}
  environment{
      DOCKERHUB_CREDENTIALS = credentials(kentan404-dockerhub)
  }
  stages {
    stage ('Build') {
      steps {
        sh 'docker build -t dockerfile'
      }
    }
    stage ('Login') {
      steps {
        sh '''
            echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u
            $DOCKERHUB_CREDENTIALS_USR --password-stdin
            '''
      }
    }
    stage ('Push') {
      steps {
        sh 'echo filler '
      }
    }
  }
}

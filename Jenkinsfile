pipeline {
  agent { label 'agent1'}
  environment{
      DOCKERHUB_CREDENTIALS = credentials('kentan404-dockerhub')
    
  }
  stages {
    stage ('Build') {
      steps {
        sh 'docker build -f dockerfile .'
      }
    }
    stage ('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage ('Push') {
      steps {
        sh '''
        var1=$( docker images --filter 'dangling=true' --format "{{.ID}}" )
        docker tag $var1 kentan404/deploy7repo:deploy7repo
        docker push kentan404/deploy7repo:deploy7repo
        '''
      }
    }
  }
}

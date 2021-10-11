pipeline {
  agent { label 'agent1'}
  environment{
      DOCKERHUB_CREDENTIALS = credentials('kentan404-dockerhub')
  }
  stages {
    stage ('Build') {
      steps {
        sh 'sudo docker build -f dockerfile .'
      }
    }
    stage ('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage ('Push') {
      steps {
        sh '''
        var1=$( sudo docker images --filter 'dangling=true' --format "{{.ID}}" )
        sudo docker tag $var1 deploy7
        echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
        sudo docker push deploy7
        '''
      }
    }
  }
}

pipeline {
    agent { label "agent1"
          }

environment {
    DOCKERHUB_CREDENTIALS = credentials("bishajit-dockerhub")
}
    stages {
          stage ('Build') {
              steps {
                  sh 'docker build -t bishajit/jenkins'
                }
              }
      
             stage ('Login') {
                    steps {
                      sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                     }
                   }

              stage ('Push') {
                   steps {
                      sh 'docker push bishajit/jenkins:latest'
          }
       }
    }
}

                                     

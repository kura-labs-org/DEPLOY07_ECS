pipeline {
    agent { label "agent-ubuntu"}

    environment{
        DOCKERHUB_CREDENTIALS = credentials('bjones25-dockerhub')
}
    stages {
        stage ('Build') {
            steps {
                sh 'docker build -t bjones25/jenkins:tagname .'
            }
        }
        stage ('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage ('Push') {
            steps {
                sh  'docker push bjones25/jenkins:tagname'
            }
        }
    }
}

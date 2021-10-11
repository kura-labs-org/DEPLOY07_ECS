pipeline {
    agent { label "agent-ubuntu"}

    environment{
        DOCKERHUB_CREDENTIALS = credentials('bjones25-dockerhub')
}
    stages {
        stage ('Build') {
            steps {
                sh 'sudo docker buildx build --platform=linux/amd64 -t java .'
            }
        }
        stage ('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage ('Push') {
            steps {
                sh 'sudo docker push bjones25/jenkins:tagname'
            }
        }
    }
}

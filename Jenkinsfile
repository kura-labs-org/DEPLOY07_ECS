ipeline {
    agent { label "Docker"}
    
    environment{
        DOCKERHUB_CREDENTIALS_USR = "iancdmitchell"
        DOCKERHUB_CREDENTIALS = credentials('iancdmitchell-dockerhub')
    }
    stages {
        stage ('Build') {
            steps {
                sh 'docker build -t javaimage .'
                
            }
        }
        stage ('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            
            }
        }
        stage ('Push') {
            steps {
                sh 'docker tag javaimage:latest imitchell:javaapp'
                sh 'docker push imitchell:javaapp:latest'
                
            }
        }
    }
}

ipeline {
    agent { label "Deploy7"}
    
    environment{
        DOCKERHUB_CREDENTIALS_USR = "didi17"
        DOCKERHUB_CREDENTIALS = "f38b02d1-d420-4879-909a-64c7b7724268"
    }
    stages {
        stage ('Build') {
            steps {
                sh 'docker build -t deploy7 .'
                
            }
        }
        stage ('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            
            }
        }
        stage ('Push') {
            steps {
                sh 'docker tag deploy7 didi17:javaapp'
                sh 'docker push didi17:javaapp:latest'
                
            }
        }
    }
}

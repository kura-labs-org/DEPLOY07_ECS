# Deploying a Jenkins Container through Fargate

## Steps to replicate

### Build a Jenkins image and push that to AWS Elastic Container Registry (ECR)

1. Create a Dockerfile to build a [Jenkins image](https://github.com/zachcyrus/jenkins_docker/tree/main/jenkins_container).

  ```
  FROM jenkins/jenkins:2.303.1-jdk11
  USER root
  RUN apt-get update && apt-get install -y apt-transport-https \
         ca-certificates curl gnupg2 \
         software-properties-common
  RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
  RUN apt-key fingerprint 0EBFCD88
  RUN add-apt-repository \
         "deb [arch=amd64] https://download.docker.com/linux/debian \
         $(lsb_release -cs) stable"
  RUN apt-get update && apt-get install -y docker-ce-cli
  USER jenkins
  RUN jenkins-plugin-cli --plugins "blueocean:1.25.0 docker-workflow:1.26"
  ```

2. Log into your AWS account and navigate to AWS ECR and create a new public repository, name the repository after the image you plan to create. I named it jenkins-image. 

3. Once your public repository has been created open up your terminal/cli and navigate to the directory containing your Dockerfile. 
4. Go back to AWS ECR and click your repositories push commands in order to push your image to AWS. The first command will verify your AWS login credentials(make you have your AWS cli configured)
The second command will build your image locally based off the Dockerfile. 
The third command will tag your image with the link to your repository on ECR.
The last command will push your image to AWS.

#### Troubleshooting 
- If you're on an M1 mac you're going to have to use Docker's buildx command to build an image that is compatible with x86 architecture. Since AWS Fargate defaults to Intel architecture.
- 
  ```
  # Use this command instead of the second command listed on AWS ECR push commands for your repository.
  docker buildx build --platform linux/amd64 -t jenkins-image .
  ```

### Create a Jenkins container on AWS

1. Navigate to AWS ECS and choose Clusters to create a new Cluster, and choose networking only with the default VPC.
2. After your cluster is created go to the task section and create a new task definition.
3. While creating your task definition link to the ECR repo where your jenkins image is hosted.

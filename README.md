# DEPLOY07_ECS
<h1 align=center>Deployment 7</h1>

Welcome to deployment 7, for this deployment you will need to follow directions in the deployment7.pdf.   

- Be sure to include the following below in your pull request: 

***Requirements:*** 
- [x]Document the process, issues and anything you decided to do differently.
- [x]Add your Jenkinsfile and Dockerfile to the pull request.

👉Link to deployment instructions: [here](https://github.com/kura-labs-org/DEPLOY7_ECS/blob/main/Deployment%237.pdf)  

![image](https://devops4solutions.com/wp-content/uploads/2020/09/Dockerpublish.png)

<h1>Goal of Deployment</h1>
Create a pipeline that will pull docker images from dockerhub, rebuild them, then push them back up to dockerhub
<h2>Infrastructure:</h2>
An analogy to look at this pipeline is that the ECS will be used as the brains of the operation, the EC2 will be used as the processing muscle, and the resources gathered stem from GitHub and Dockerhub.
Utitilizing EC2 Ubuntu with Docker and as agent for building through Jenkins Push and deploying the new image as a container.
ECR Utilized to host a jenkins image for use for ECS so that multiple orchestration software can be created in little to no time.
ECS utilized as a container cluster service to faciliate building through github pulls of the Jenkinsfile and Dockerfile

<h1>Steps:</h2>

<h2>Prior</h2>
For this deployment we will be reusing a previous class's docker image that was provided by instructure to build into a a docker imge for deployment. This java application is a java web app that uses Springboot. This means that maven or something similar must be used to compile and then made into an image. The steps taken here will not be discussed, but a simplified way discussing what was done to the image prior, which created the target folder was the use of a maven image that was dockerized to target and compile the java files with pom.xl to a jar. We will be using that target folder created as our target for the Dockerfile.

Set up a dockerhub account as well as a github repository that have the Dockerfile and Jenkinsfile with the configurations that are in the current repository.

<h2>EC2</h2>

1) Set up EC2 with Ubuntu on a VPC and remember the subnet (we'll call this subnet a.
2) Set SG here to allow SSH anywhere. We left this here for simplification, but we could also set it to allow for specific IPs for the ECS later if it's desired. For testing, this is fine, for production, this should be set to private with allowed outbound through an internet gateway.
3) Bootstrap an update and upgrade command, then add the necessary programs needed for https and ca-certificate followed by adding repo for [Docker Engine](https://docs.docker.com/engine/install/ubuntu/) and then updating and install for docker.
4) Add current user to Docker group to reduce need for sudo before every docker command.
5) Check docker installed using docker --version
6) Install Java jdk through default-jre package. (This is to allow Jenkins Agent to be used)
7) Download [AWSCLI2](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html). (This is important)
8) Set up AWSCLI2 with credentials for AWSCLI. This is located in IAM -->User -->Security Credentials Tab.
9) Run `docker pull jenkins/jenkins` on EC2

<h2>Dockerhub</h2>

1) Dockerhub will have a credentials in the Jenkinsfile. Have Dockerhub create a personal token for use with the account repository.
2) This can be placed in the git repo, but a better option is to create an [environment variable](https://www.serverlab.ca/tutorials/linux/administration-linux/how-to-set-environment-variables-in-linux/) in the EC2 that the Jenkinsfile can reference. This is safer and a better alternative to exposing the key directly.
3) This is also an alternative [credential option](https://appfleet.com/blog/building-docker-images-to-docker-hub-using-jenkins-pipelines/).

<h2>ECS</h2>

1) Using EC2 
2) Go into your AWS Account for ECR. Set up a private ECR.
3) Follow the instructions on how to log in, how to tag, and how to push the image to the ECR. You may skip the build command since we are using the image as is.
4) Create an ECS cluster on default. Create a Task Definition. Create A New Task. To understand what is going on. The short answer is you're creating parameters of groups and subgroups that will define what your intents are for the services such as processing power, the VPC networking, and security, then you can create this group in a replicated way for fast deployment. We will set the clusters to a fargate as the intent is to use this as a brain, not a processor.
5) Most importantly, when creating the service, a setting for security groups will exist as well as VPC and subnet. This must have a port 8080 open to your current device IP for security reasons and the VPC and subnet must be same as the EC2.
6) Run the service, an IP will be provided. Go into the logs.
7) Filter out the logs to search for a query that has `initialAdminPassword` as the line above that log line will have a string of characters, which will be needed to unlock and proceed set up with Jenkins.
8) Log into the ECS through the public IP on port 8080. Add the password, install recommended, then Install Docker Pipeline and Amazon EC2 plug-in.
9) Head into the agent/ndoe configures and connec the EC2 with the Jenkins. You can use the private IP for this as both settings should be on the same subnet.
10) Create a mulitbranch pipeline with Github credentials and default on all settings.
11) Let Jenkins scan the repo, then build now.

![image](https://github.com/kawangwong/DEPLOY07_ECS/blob/main/Topology%20Design.png)

# Deployment 7 Documentation

* [Task](#Task)
* [Materials](#Materials)
* [Procedure](#Procedure)

## Task
The objective of Deployment 7 is to configure an Amazon Elastic Container Service to run a Java Application on Jenkins. Since ECS is being used, container supporting software must be used in this project. In this guide, Docker will be used. To create any Docker container, a Dockerfile is needed to instruct how to make an image that is reponsible for building the container. When using the Amazon Elastic Container Service, a cluster and task definition are neccessary to run an ECS. To use an ECS to access Jenkins, the cluster and task definition security ports must be configured to allow Jenkins to run on localhost:8080. To run a Java application on Jenkins, version control software is needed to store the latest version of the application for Jenkins to access, read and execute the files. These files can be stored in a Github repository.   

## Materials
* Computer (Local Host)
  * Docker installed on Computer

* Dockerfile
* Jenkinsfile

* GitHub Account
  * Create a Repo to store and read project files
  
* Dockerhub Account

* Have a Registered AWS Account to use the Following Services: 
  * EC2 (Elastic Compute Cloud) - This is the Agent
    * Docker installed on EC2
    * Install Maven
  * ECS (Elastic Container Service) and Task Definition
    * Create a Cluster using and configuring ECS and Task Definition to access Jenkins from AWS
  * ECR (Elastic Container Registry) 

## Procedure

1. Create an Ubuntu EC2 on AWS (You can choose to create a Amazon EC2. Installing the needed packages for this task is more efficent on an Ubuntu EC2.)
2. When configuring the EC2, follow these rules:
* Step 2: Choose an Instance Type - t2.micro
* Step 3: Configure Instance Details - In the Network box, choose default VPC. In the Subnet box, choose a public subnet. In Auto-Assign Public IP, use subset setting enable
* Step 6: add ssh and for source choose anywhere
3. Run the following commands on the EC2 in order:
* sudo apt update
* sudo apt upgrade <br>
Installing Docker:
* sudo apt-get install \ apt-transport-https \ ca-certificates \ curl \ gnupg-agent \ software-properties-common
* curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - apt-cache madison docker-ce
* sudo apt install docker.io
* sudo apt install docker-compose
5. Make a Github Repository 
6. In the Github repository, make a Dockerfile and Jenkinsfile. Also include java jar files. Refer to https://github.com/AndrewDass1/DEPLOY07_ECS for more details. 
7. Create a ECR
8. Obtain a jenkins image to create a container. On your local computer, use the command docker pull jenkins/jenkins to obtain the image and then push it to the ECR
9. Create a Task Definition, when asking for an image, paste the URI of the jenkins image you made and edit security group to 8080 to access Jenkins
10. Create a ECS Cluster, choose the created task definition and allow port mapping 8080 
11. In the ECS, go to logs and scroll in the logs to obtain the Jenkins password. The password is a bunch of numbers and letters that are randomly generated in one line.
12. Go to your internet browser and type in localhost:8080 to access Jenkins. 
13. Insert the password retrieved from AWS
14. Install suggested plugins and make a Jenkins account. 
15. Afterwards in Jenkins, install the suggested plugins: Docker Pipeline Plugin (should be installed already if not, install it) and AWS EC2 Plugin
16. Make a new multibranch pipeline project in Jenkins, make sure to connect credentials in order for this project to read the Jenkinsfile and Dockerfile
17. After making a new Jenkins project, go to Manage Nodes and Clouds
18. Make a new agent and place that agent to be the Ubuntu EC2 we created
19. Run the project in Jenkins and it should be successful

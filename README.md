# Deployment 7 Documentation

* [Task](#Task)
* [Materials](#Materials)
* [Procedure](#Procedure)

## Task
The objective of Deployment 7 is to configure an Amazon Elastic Container Service to run a Java Application on Jenkins. Since ECS is being used, container supporting software must be used in this project. In this guide, Docker will be used. To create any Docker container, a Dockerfile is needed to instruct how to make an image that is reponsible for building the container. When using the Amazon Elastic Container Service, a cluster and task definition are neccessary to run an ECS. To use an ECS to access Jenkins, the cluster and task definition security ports must be configured to allow Jenkins to run on localhost:8080. To run a Java application on Jenkins, version control software is needed to store the latest version of the application for Jenkins to access, read and execute the files. These files can be stored in a Github repository.   

<br>

## Materials
* Computer (Local Host)
  * Docker installed on Computer

* Dockerfile
* Jenkinsfile

* GitHub Account
  * Create a Repo to store and read project files

* Have a Registered AWS Account to use the Following Services: 
  * EC2 (Elastic Compute Cloud)
    * Docker installed on EC2
  * ECS (Elastic Container Service) and Task Definition
    * Create a Cluster using and configuring ECS and Task Definition to access Jenkins from AWS


<br>

## Procedure


<br>

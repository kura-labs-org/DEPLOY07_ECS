### Deployment 7 Documentation
Darren Freeman
ECS


In this deployment we will be deploying on Elastic Container Service. Amazon ECS is a very versatile fully managed container orchestration service that makes it easy to deploy, manage and scale containerized applications.

First this Deployment calls for spinning up an Ubuntu EC2 but I decided to go with amazon Linux 2 instead. Mainly for the sake of speed and being more familiar with the way it works. 

We have to 


Now we have to create a Dockerfile with the following:
FROM openjdk:11
COPY ./demo-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
CMD java -jar demo-0.0.1-SNAPSHOT.jar

Now in AWS open Elastic Container Service and create a task definition for Jenkins

Then we go to ECS and create a networking only cluster and select Fargate, the serverless compute engine, which is one of AWS’ managed services.

Create a new Pipeline and connect it to you Github Repo

Add the Jenkins file to the Github Repo that you will be using to create the image of the
Java application, login and push to Docker Hub

Generate an access token from Docker Hub and add it to the global credentials in
Jenkins along with your Docker Hub username

Create an agent Node on Jenkins on which to run your build

![image](https://user-images.githubusercontent.com/9061503/147017120-25748afb-f59c-498c-8659-c8b4a4e209f8.png)

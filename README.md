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
Create a pipeline that will pull docker images, rebuild them, then push them back up to dockerhub
<h2>infrastructure:</h2>
Utitilizing EC2 Ubuntu with Docker and as agent for building through Jenkins Push and deploying the new image as a container.
ECR Utilized to host a jenkins image for use in ECS
ECS utilized as a container cluster service to faciliate building through github pulls of the Jenkinsfile and Dockerfile.

# DEPLOY07_ECS
<h1 align=center>Deployment 7</h1>

Welcome to deployment 7!

The goal of this deployment was to automate the dockerization of an application and to push it onto dockerhub to make it available. 

For more details on the project you can look [here](https://github.com/KennethT404/DEPLOY07_ECS/blob/main/Deployment%207%20Documentation%20-%20Ken.pdf) !  
👉Link to deployment instructions: [here](https://github.com/kura-labs-org/DEPLOY7_ECS/blob/main/Deployment%237.pdf)  

![image](https://devops4solutions.com/wp-content/uploads/2020/09/Dockerpublish.png)

Docker creates lightweight continaers that can host applications without the fear of interference with potentially incompoatible software. This also allows for the application to be portable, meaning it can be deployed on almost any machine. 

The automation of the docerizing processes was done in Jenkins. This was achieved by running Jenkins in a contianer and acting as the Master/Controller and having it delegate the task of creating the dockeriamge from the application, logging into DockerHub and then pushing it into the repository. This docker container was chosen to the be the Master in this architecture because the build process and work was given to a seperate EC2 node. This made Jenkins something lightweight and able to be hsoted on the container. 



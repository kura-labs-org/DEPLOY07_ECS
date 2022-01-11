### Documentation


# Table of Contents
- Docker commands in Terminal
- Github
- AWS 
- Ubuntu  
- Jenkins
- Docker Hub
- Issues


# AWS

* ECR

Create a repository


After the repository is created, select the repository that you created and select view push commands. 
Then add the commands into terminal to push image onto AWS ECR.

# Docker Commands

In the terminal create the image and connect it to ECS and push it to AWS using these commands found located in push commands tab.

```
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/--------
docker build -t jenkins .
docker images
docker tag jenkins:latest public.ecr.aws/--------/jenkins:latest
docker push public.ecr.aws/--------/jenkins:latest
```


* EC2

![image](https://user-images.githubusercontent.com/84725239/137370150-5c98989d-c8db-47a9-a0d5-c1ed06868a00.png)

After creating a ubuntu instance, next it was time to enter terminal and go to the folder with key
then ssh.

```
ssh -i newkey.pem.txt ubuntu@(public ip address given)
```

* ECS

First go to the ECS and create a cluster.


![Screen Shot 2021-10-13 at 9 08 22 AM](https://user-images.githubusercontent.com/84725239/137502638-ea949893-533a-4c00-b74d-bbb55f1c3c21.png)


Networking only will be the first tab selected only thing given to this cluster was a name the vpc the default was used.

![Screen Shot 2021-10-13 at 9 09 03 AM](https://user-images.githubusercontent.com/84725239/137374803-79523cc7-7afe-405e-917a-47daf27121cb.png)

![Screen Shot 2021-10-13 at 9 08 55 AM](https://user-images.githubusercontent.com/84725239/137374822-0e169f37-0394-4dd7-95a5-7074176b8549.png)


Next go to the task definition tab and create a new task definition and select Fargate


![Screen Shot 2021-10-13 at 9 09 37 AM](https://user-images.githubusercontent.com/84725239/137374790-3c84a144-9510-49f2-8b8f-fc4a680557df.png)


When creating the task definition, these were the specific configurations needed


Task role 
- selected ECStaskExecutionRole

Task size
- Task memory (GB) 4GB
- Task CPU (vCPU) 1vCPU

Container definitions
- Click on add a container

In image box get from repository the repository-url/image:tag (should look something like this public.ecr.aws/--------/jenkins:latest , found in ECR)

Port mappings
- 8080 tcp

After the task definition is created use the Public IP and attach it to :8080 to get into Jenkins.

The password is needed to access Jenkins, it will be in the logs of the cluster.

# Jenkins

- Docker pipeline plugin

- AWS EC2 plugin

Input Credentials For Docker, Ubuntu instance, and Github. Download recommended plugins and also download these following plugins.


![Screen Shot 2021-10-11 at 11 41 09 PM](https://user-images.githubusercontent.com/84725239/137374956-e692f2be-2ee8-455c-b809-2982d43a2f25.png)


Configure Jenkins agent, then a Multibranch Pipeline. After assigning label, remember to add to label to Jenkinsfile on GitHub.

# Ubuntu

In ubuntu vm instance
```
-curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

-sudo apt-get install unzip

-sudo apt update

-sudo apt install default-jdk

-sudo ./aws/install

-sudo apt-get unzip awscliv2.zip

-unzip awscliv2.zip

-aws configure

-pwd

```


```
-sudo apt update


-sudo apt install software-properties-common ca-certificates curl gnupg-agent apt-transport-https


-curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

-sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu \$(lsb_release -cs) \stable"

-sudo apt update

-sudo apt install docker-ce docker-ce-cli containerd.io

```

# Github
 
* Within the folder that contains the snapshot
- Drag file to GitHub demo-0.0.1-SNAPSHOT.jar 
* After assigning label given to agent in jenkins, add it to jenkinsfile on github
Within Jenkinsfile add commands 

```
docker build -t javaapp .
docker tag javaapp:latest 32322323/javaapp
sh "docker push 32322323/javaapp:latest"
 ```
 
 These commands allow for the Build to run successfully as well as the image to be pushed to DockerHub.
                

![Screen Shot 2021-10-14 at 2 30 17 PM](https://user-images.githubusercontent.com/84725239/137375458-30dbb911-362a-45c8-b702-d3ecba76e8ab.png)



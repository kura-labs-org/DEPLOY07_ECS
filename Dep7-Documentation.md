# Deployment 7
### Objective
**We want to create a container with Jenkins, to build a Java app onto a container hosted by an EC2.**

### Create the EC2
We begin by initiating an Ubuntu AMI EC2. We need Java as well as Docker installed on this EC2 if we wish to complete our task. I used an EC2 that I had previously configured with Java and installed Docker on it:
```
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

### Create the ECS Cluster
1) On the ECS dashboard, crete a new repository under ECR. 
    - Select **Public**, enter your repository name, click **Create Repository**.
2) In your local terminal, get a Jenkins Docker image and push it to your ECR respoitory.
```
docker pull jenkins/jenkins
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/repo-tag
docker tag image-name:tag-name public.ecr.aws/repo-tag/repo-name:tag-name
docker push public.ecr.aws/repo-tag/repo-name:tag-name
```
3) Create a cluster.
    - Select **Networking Only**, name the cluster, create the cluster.
    - Next create a New Task Defintion. When creating the container use the image URI from our jenkins image we pushed earlier to ECR earlier.
    - Assign the Task to the Cluster. When it is running, grab the public IP and access the container via port 8080.

### Github
Let's set up our github with three files: 
1) The .jar file that holds the information to build our Java app.
2) The Dockerfile that will build an image of our Java app.
3) The Jenkinsfile that will run the Dockerfile and push our image to Dockerhub.

### Jenkins
1) Configure Jenkins. We need two plugins: `Docker Pipeline` and `AWS EC2`. 
2) Once these are installed add an agent hosted by our EC2 (use private IP).
3) Add credentials:
    - We need to add Github login using the Personal Access Token as the password.
    - We need to add Docker login using the Personal Access Token as the password.
    - We need to add SSH login using the IP and .pem file for the agent EC2.
4) Create a multi-branch pipeline that pulls from the repo you set up.
5) Run it and check your Dockerhub to see if the Java app image has been uploaded.

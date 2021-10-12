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
1) On the ECS dashboard, crete a new repository. 
    - Select **Public**, enter your repository name, click **Create Repository**.
2) In your local terminal, get a Jenkins Docker image and push it to your repository.
```
docker pull jenkins/jenkins
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/repo-tag
docker tag image-name:tag-name public.ecr.aws/repo-tag/repo-name:tag-name
docker push public.ecr.aws/repo-tag/repo-name:tag-name
```

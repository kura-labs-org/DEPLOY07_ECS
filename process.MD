# Deploying Python app on Kubernetes cluster using Windows Subsystem for Linux (WSL)
## Creating the Docker image
- Copied fake_news app from Windows to Linux environment. App included requirements.txt file.
```python
#Navigate to main user directory (/home/ian_mitchell) and created flask_app_deployment directory
cd
mkdir flask_app_deployment 
#Mounted the Windows C: drive
cd /mnt/c
#Navigated to the location of the fake_news directory 
cd Users
cd "Ian MItchell"
#Copied entire diredtor to the flask_app_deployment directory 
cp -r fake_news ~/flask_app_deployment
```
- Created Dockerfile inside flask_app_deployment directory and entered required commands to create Docker image with fake_news app with all dependencies
```python
cd ~/flask_app_deployment
nano Dockerfile
```
*Contents of Dockerfile*
```python
FROM python:3.8
RUN apt-get update -y && apt-get install -y python3-pip python3-dev
COPY ./fake_news/requirements.txt /fake_news/requirements.txt
WORKDIR /fake_news
RUN pip install -r requirements.txt
COPY fake_news .
ENV FLASK_APP=application.py
EXPOSE 5000
CMD flask run --host=0.0.0.0
```
| :warning: WARNING          |
|:---------------------------|
| Ensure that the correct Python version is running. Dependencies require 3.6 to 3.8 for this particular app.     |
- Built Docker image which would include all dependencies then checked to ensure the image was present
```python
docker build -t flask-fake-news:latest .
docker images
```
- Ran the Docker image in a container to ensure that there were no errors in the application
```
docker run -d -p 5000:5000 flask-fake-news
``` 
*Screenshot of Fake News app running on Docker container on localhost on port 5000*
![image](https://user-images.githubusercontent.com/5831590/137570575-8e731669-af00-439e-b632-a213f173976b.png)

| :memo: TIP          |
|:---------------------------|
| Use "docker logs CONTAINER_ID" to check the logs if there are 500 errors     |

| :memo: TIP          |
|:---------------------------|
| Use "docker container exec -it CONTAINER_ID ls /" to browse the container     |


## Pushing Docker image to DockerHub
- Rebuilt and tagged Docker image with my DockerHub account username
```python
 docker build -t iancdmitchell/flask-fake-news:latest .
```
| :memo: TIP          |
|:---------------------------|
| It will rebuild the image using the cache of the previous build so it will be completed in seconds     |

| :memo: TIP          |
|:---------------------------|
| Since it is being pushed to DockerHub, the server name does not have to be specified such as docker.io/iancdmitchell/flask-fake-news:latest     |

- Pushed Docker image to my account on DockerHub
```python
docker push iancdmitchell/flask-fake-news:latest
```
| :warning: WARNING          |
|:---------------------------|
| Ensure that you are logged into DocherHub. Use "docker login". https://docs.docker.com/engine/reference/commandline/login/    |

## Setting up the Kubernetes cluster
- Created Kubernetes cluster with a load balancer set up to be accessed via port 8081 and map to container on port 8080
```python
k3d cluster create fake-news-cluster -p "8081:8080@loadbalancer"
```
| :memo: TIP          |
|:---------------------------|
| If it fails because port 8080 is already in use, check the list of containers with "docker ps -a" and stop the other container with "docker stop CONTAINER_ID"     |

k3d cluster list

- Created YAML file inside flask_app_deployment directory and entered required values including port 5000 which is required for a Flask app and the path to the image on Dockerhub. The YAML file creates the *deployment* container first followed by the *load balancer service* container.
```python
nano fake-news.yml
```
*Contents of YAML file*
```python
apiVersion: apps/v1
kind: Deployment
metadata:
  name: fake-news-deployment
spec:
  selector:
    matchLabels:
      app: fake_news
  replicas: 1 # tells deployment to run 1 pods matching the template
  template: # create pods using pod definition in this template
    metadata:
      labels:
        app: fake_news
    spec:
      containers:
      - name: fake-news-container
        image: iancdmitchell/flask-fake-news:latest
        ports:
        - containerPort: 5000

---

apiVersion: v1
kind: Service
metadata:
  name: fake-news-service
spec:
  type: LoadBalancer
  ports:
  - port: 8080
    protocol: TCP
    targetPort: 5000
  selector:
    app: fake_news

```
| :memo: NOTE          |
|:---------------------------|
| Kubernetes cluster uses port 8080. 
Load balancer uses port 8081. 
Docker container/Kubernetes pod uses port 5000.     |

- Ran the YAML file and then checked the list of containers.
```python
kubectl create -f fake-news.yml
kubectl get all
```
- I then checked the status of the container that was just created. I had to wait until the status is RUNNING for both the service and the deployment.
```python
kubectl get pod
```
- Once the status of both contniners is RUNNING, the application will be available at localhost:8081
*Screenshot of Fake News app running on Kubernetes container on localhost on port 8081*
![image](https://user-images.githubusercontent.com/5831590/137602081-73dfa723-3694-4438-948e-132a87e6fe0a.png)

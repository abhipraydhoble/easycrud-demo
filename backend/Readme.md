### Install Dockerr 
````
sudo apt update -y
sudo apt install docker.io  -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ubuntu
newgrp docker
sudo chmod 777 /var/run/docker.sock
docker --version
````
---

### Create Docker Image and Push to DockerHub

````
docker build -t abhipraydh96/backend .
````

````
docker push abhipraydh96/backend
````
---

### Edit backend.yaml and update docker image

---

### Apply manifest files 

---
### Copy backend service link and paste to frontend dir .env file 

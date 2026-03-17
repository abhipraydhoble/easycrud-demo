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
### Edit Application.properties file and add db credentials
<img width="1686" height="947" alt="image" src="https://github.com/user-attachments/assets/a57dc59d-6ca2-4aad-abe2-587fc6fc39da" />

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

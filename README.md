# 🖥️ Launch instance and use below user data to setup eks cluster

````
#!/bin/bash

sudo apt update -y
sudo apt install -y curl unzip

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install eksctl
curl --silent --location \
"https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" \
| tar xz -C /tmp

sudo mv /tmp/eksctl /usr/local/bin
sudo chmod +x /usr/local/bin/eksctl
````
````
aws --version
kubectl version --client
eksctl version
````
**Configure AWS CLI**
````
aws configure
````

**Create Amazon EKS cluster using eksctl**
````
eksctl create cluster --name eks-oncdecb36 --region ap-southeast-1 --version 1.34 --nodegroup-name linux-nodes --node-type t3.medium --nodes 1
````
**Log In Into EKS cluster**
````
aws eks update-kubeconfig --name eks-oncdecb36
````
**Delete EKS Cluster**
````
eksctl delete cluster --name eks-oncdecb36 --region ap-southeast-1
````

---
### 🐬 Setup Mysql
- wait for cluster and rds creation
- Create Mysql instance using AWS RDS. and connect to cluster worker node
- Connect to your RDS instance :

---
<img width="1907" height="782" alt="image" src="https://github.com/user-attachments/assets/57761e95-85de-4f2d-b645-b1d164cb65d9" />


```bash
sudo yum update -y
sudo yum install mariadb105-server -y
```
**Login To RDS**
````
mysql -h <rds-endpoint> -u <db-username> -p<password>
````

- Create the database:

```sql
CREATE DATABASE student_db;
```
```
USE student_db;
```

- Create the students table:

```sql
CREATE TABLE `students` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `student_class` varchar(255) DEFAULT NULL,
  `percentage` double DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
```

- Exit MySQL:

```bash
exit
```
---
# ⚙️ Backend
---

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

---

# 🌐 Frontend
---

### Edit .env file and add Backend service url

<img width="1182" height="51" alt="image" src="https://github.com/user-attachments/assets/1ee5d68e-33bc-4888-82b1-e1fa52e0a91f" />

---


### Build Docker Image and push to Dockerhub

---


### Edit frontend.yaml and change image name

---


### Apply manifest file and copy frontend service link and check

<img width="1917" height="1020" alt="image" src="https://github.com/user-attachments/assets/7887b394-6608-4894-8a67-1b829d985d6e" />
<img width="1116" height="895" alt="image" src="https://github.com/user-attachments/assets/40b9ad2d-bd0d-40f5-bd8b-6be127999aac" />




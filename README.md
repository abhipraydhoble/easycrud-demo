# 🖥️ Launch instance and use below user data to setup eks cluster

````
#!/bin/bash

# Update system
apt update -y

# Install basic tools
apt install -y curl unzip

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install eksctl
curl --silent --location \
"https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" \
| tar xz -C /tmp

mv /tmp/eksctl /usr/local/bin
chmod +x /usr/local/bin/eksctl
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
###  Setup Mysql
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



- Note: check port no 3306 added in security group



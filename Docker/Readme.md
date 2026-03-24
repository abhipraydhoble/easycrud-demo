
### Launch an ec2 instance(ubuntu)
 - use following script to install docker and mysqlclient

````

#!/bin/bash
sudo apt update
sudo apt install mysql-client -y
git clone https://github.com/abhipraydhoble/studentapplication.git
sudo apt update -y
sudo apt install docker.io  -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ubuntu
newgrp docker
sudo chmod 777 /var/run/docker.sock
docker --version
````

### Login to RDS

```bash
mysql -h <rds-endpoint> -u admin -p
```

---

### Create Database

```sql
CREATE DATABASE student_db;
```

```sql
USE student_db;
```

---

### Create Students Table

```sql
CREATE TABLE students (
id bigint NOT NULL AUTO_INCREMENT,
name varchar(255),
email varchar(255),
course varchar(255),
student_class varchar(255),
percentage double,
branch varchar(255),
mobile_number varchar(255),
PRIMARY KEY (id)
);
```

---

### Exit MySQL

```bash
exit
```

---
### Configure Database Connection

Edit file:

```bash
vim src/main/resources/application.properties
```

### Build Docker image and push to dockerhub 

````
docker build -t abhipraydh96/backend .
````
````
docker push abhipraydh96/backend
````

### Create Backend COntainer
````
docker run -itd --name backend -p 8080:8080 abhipraydh96/backend
````


---
### COnfigure Backend Frontend Connection

- edit file
````
vim .env
````
- add instance ip addresss

### Build Docker image and push to dockerhub 

````
docker build -t abhipraydh96frontend .
````
````
docker push abhipraydh96/frontend
````

### Create Backend COntainer
````
docker run -itd --name frontend -p 80:80 abbhipraydh96/frontend
````

<img width="1867" height="923" alt="image" src="https://github.com/user-attachments/assets/4287e8e8-3518-42f6-9cf2-750434309ba3" />


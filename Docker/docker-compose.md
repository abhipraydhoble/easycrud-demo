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
### Configure Database Connection(Backend)

Edit file:

```bash
vim src/main/resources/application.properties
```

### COnfigure Backend Frontend Connection(Frontend)

- edit file
````
vim .env
````
- add instance ip addresss


# docker-compose installation

````
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d'"' -f4)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
````
````
sudo chmod +x /usr/local/bin/docker-compose
````
````
docker-compose --version
````

# Run Compose file to create containers
````
docker-compose up -d
````
# Remove containers
````
docker-compose down -d
````

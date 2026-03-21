## Tech Stack

### Database
- MySQL 

### Backend
- Java
- Spring Boot
- Maven
- REST APIs

### Frontend
- HTML
- CSS
- Bootstrap
- JSP
- Node.js (npm – frontend build tool)
 --- 
 ## Application Workflow
 
<img width="1302" height="510" alt="image" src="https://github.com/user-attachments/assets/a52ef8ae-38cb-4e81-be4c-c3826ce6745a" />

---


---
### Security Group Rules

Add inbound rules:

<img width="1471" height="332" alt="image" src="https://github.com/user-attachments/assets/d1a40a3e-69e5-4740-884c-564978b45212" />

---
# Launch EC2 Instance (Ubuntu)

<img width="1588" height="286" alt="image" src="https://github.com/user-attachments/assets/021478fe-e41c-4296-9b31-ee84b765adf4" />

---

# Setup MySQL Database (AWS RDS)

Create a MySQL database using AWS RDS.
<img width="1512" height="270" alt="image" src="https://github.com/user-attachments/assets/d66bad7d-f0bf-41d3-aef8-cbe78d03414d" />


Copy the RDS endpoint.
<img width="1915" height="696" alt="image" src="https://github.com/user-attachments/assets/86510f79-e91e-49a0-a871-00132cd6da7f" />

Example:

```
studentdb.xxxxx.ap-south-1.rds.amazonaws.com
```

---

### Connect to instance and  Install MySQL Client on EC2

```bash
sudo apt update
sudo apt install mysql-client -y
```

---

### Login to RDS

```bash
mysql -h <rds-endpoint> -u admin -p
```

Example:

```bash
mysql -h studentdb.xxxxx.ap-south-1.rds.amazonaws.com -u admin -p
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


---

# Setup Backend (Spring Boot)

### Clone Repository

```bash
git clone https://github.com/abhipraydhoble/project-studentapp-aws.git
```

---

### Install Java 17

```bash
sudo apt install openjdk-17-jdk -y
```

Verify:

```bash
java -version
```

---

### Install Maven

```bash
sudo apt install maven -y
```

Verify:

```bash
mvn -version
```

---

### Navigate to Backend Directory

```bash
cd project-studentapp-aws/Backend
```

---

### Configure Database Connection

Edit file:

```bash
vim src/main/resources/application.properties
```

Add:

```properties
server.port=8080

spring.datasource.url=jdbc:mariadb://<rds-endpoint>:3306/student_db

spring.datasource.username=admin

spring.datasource.password=admin123

spring.jpa.hibernate.ddl-auto=update
```
<img width="1917" height="405" alt="image" src="https://github.com/user-attachments/assets/e7c9a0ef-e781-4574-9f9d-58a35ef6f7dc" />

---

### Build Backend Application

```bash
mvn clean package -DskipTests
```

---


---

# Setup Frontend (React)

### Navigate to Frontend Directory

```bash
cd ../Frontend
```

---

### Install Node.js and npm

```bash
sudo apt install nodejs npm -y
```


---

### Configure Backend API URL

Edit file:

```
vim src/api/userService.js
```

Example:

```js
const BASE_URL = "http://EC2-IP:8080/api";
```
<img width="1588" height="477" alt="image" src="https://github.com/user-attachments/assets/93a1636c-0b6d-4416-a5a8-b9dfd92c7a2a" />

---

### Install Frontend Dependencies

```bash
npm install
```

---

### Run Frontend Application

```bash
npm start
```


---

### Build Frontend Application

```bash
npm run build
```

---

# Host Frontend Using Apache 

### Install Apache

```bash
sudo apt install apache2 -y
```

---

### Copy Build Files

```bash
sudo cp -r dist/* /var/www/html/
```

---

### Start Apache

```bash
sudo systemctl start apache2
```

---
### Run Backend Application
- go to backend dir
````
cd ../Backend/target/
````
```bash
java -jar student-app.jar
```
### Access Website

```
http://EC2-IP
```
<img width="1918" height="970" alt="image" src="https://github.com/user-attachments/assets/6e9ca2e4-c9d4-4650-bf1c-0bf1b80654f2" />

---



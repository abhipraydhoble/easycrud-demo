


### 1. Setup MariaDB 
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



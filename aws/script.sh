#!/bin/bash
sudo apt update
sudo apt install mysql-client -y
git clone https://github.com/abhipraydhoble/project-studentapp-aws.git
sudo apt install openjdk-17-jdk -y
sudo apt install maven -y
sudo apt install nodejs npm -y
sudo apt install apache2 -y
java -version
mvn -version
npm -v
node -v

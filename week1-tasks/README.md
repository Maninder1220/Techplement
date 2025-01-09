# Techplement
This project deploys WordPress and MySQL in monolithic and microservices architectures. In monolithic, both run on one public EC2 instance. In microservices, WordPress is on a public EC2 and MySQL on a private EC2. Built with Terraform, it uses modular code, secure networking, and demonstrates scalability and architecture transitions.


# WEEK ONE TASK
TASK : Deploy application in monolithic and microservices architecture.

# FOLDER STRUCTURE FOR TASK
I have created two directories under TECHPLEMENT/week1-tasks.

Directory one /IaC :
In this directory i have all codes related to my infracture in modular format.

Directory two /Scripts : 
In this directory i have all script related to project which will be required to setup infrastructure so it can run smoothly

# HOW TO MAKE INFRASTRUCTURE UP AND RUNNING
To make infrastrastructure up and running first navigate to folder week1-tasks/IaC/i - monolithic/Root and week1-tasks/IaC/i - microservice/Root respectively, it depends on which infrastructure needs to run first.

Once in /Root Directory enter the following command in sequnce in terminal
- terraform init
- terraform plan
- terraform apply

Once everything is up and running you will get ec2 ip as a output and .pem file will be in root folder, ssh in ec2 using following command through local terminal, pem file will be present in /Root directory
- sudo ssh -i "nameofpemfile.pem" ubuntu@publicip

# WHAT TO DO AFTER INFRASTRUCTURE IS UP AND RUNNING
Once everything is up and running and ssh is done in respective ec2 do the necessary setup depends on infrastructure, supporting scripts are in /Scripts directory and additional useful commands is in current README.md


# FEW USEFUL COMMANDS
# DEBUG SSH 
sudo ssh -v -i "mono_Private_pem_Key.pem" ubuntu@65.2.29.50

# SSH 
sudo ssh -i "mono_Private_pem_Key.pem" ubuntu@65.2.29.50

# CREATE Mysql User
# Create a New MySQL User
sudo mysql -u root -p 
CREATE DATABASE wordpress_db;
CREATE USER 'Admin'@'%' IDENTIFIED BY 'Admin@123';
GRANT ALL PRIVILEGES ON wordpress_db.* TO 'Admin'@'%';
FLUSH PRIVILEGES;
EXIT;

# Allow MySQL to listen on all interfaces
make changes here  /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL Service
sudo systemctl restart mysql

# Check Installation
/var/log/cloud-init-output.log


# AWS terraform.tfvar file content
vpc_cider_block = "10.0.0.0/16"
private_subnet = "10.0.1.0/24"
public_subnet = "10.0.3.0/24"


public_destination_cider = "0.0.0.0/0"
private_destination_cider = "0.0.0.0/0"

region = "ap-south-1"



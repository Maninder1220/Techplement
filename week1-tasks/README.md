# Techplement
This project demonstrates the evolution of a web application from a monolithic architecture to a microservices architecture using WordPress as the application layer and MySQL as the database. The infrastructure is created and managed using Terraform, while Nginx is used as the web server.


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
sudo sed -i 's/bind-address.*/bind-address = 10.0.1.208/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL Service
sudo systemctl restart mysql


# Nginx Script
server {
    listen 80;
    server_name 65.2.29.50;

    root /var/www/html;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ .php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}

# Check Installation
/var/log/cloud-init-output.log

# BAstian SSH
ssh ec2-user@privateip


# SSh Agent Forwarding

# check if agent is running
eval 'ssh-agent'  

# Add Key pair to ssh agent | Add without -K
ssh-add -K ./filename.pem

# change permission 
chmod 400 filename.pem
 # then add again 

 # NOW IT IS ADDED TO SSH AGENT

 # how to use forwarding

 # connect to public instance
 ssh -A -i filename.pem ec2-user@ip

 # Connect to Private Instance
 ssh ec2-user@privateip 
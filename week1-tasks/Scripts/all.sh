#!/bin/bash

# Update System Packages
sudo apt update && sudo apt upgrade -y

# Install Nginx
sudo apt install nginx -y

sudo systemctl start nginx   # Start
sudo systemctl enable nginx  # Enable

# Update System Packages
sudo apt update && sudo apt upgrade -y

# Install PHP and Extensions
sudo apt install php php-fpm php-mysql php-mbstring php-xml php-gd php-curl php-zip php-imagick -y

sudo systemctl start php-fpm   # Start
sudo systemctl enable php-fpm  # Enable

# CONFIGURE NGINX

# INSTALL WORDPRESS
cd /var/www/html
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xvzf latest.tar.gz
sudo mv wordpress/* .
sudo rm -rf wordpress latest.tar.gz

# SET PERMISSIONS
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

# Update System Packages
sudo apt update && sudo apt upgrade -y

# Install MySQL Server
sudo apt install mysql-server -y

sudo systemctl start mysql  # Start MySQL Service
sudo systemctl enable mysql  # Enable MySQL Service

# Secure MySQL Installation
sudo mysql_secure_installation



#!/bin/bash

# Update System Packages
sudo apt update && sudo apt upgrade -y

# Install MySQL Server
sudo apt install mysql-server -y

sudo systemctl start mysql  # Start MySQL Service
sudo systemctl enable mysql  # Enable MySQL Service

# Secure MySQL Installation
sudo mysql_secure_installation




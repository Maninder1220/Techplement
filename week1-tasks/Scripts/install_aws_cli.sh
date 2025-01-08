#!/bin/bash

# Script to install AWS CLI on Ubuntu
set -e

echo "Starting AWS CLI installation process..."

# Step 1: Update package list and install required dependencies
echo "Updating package list and installing required dependencies..."
sudo apt update -y
sudo apt install -y curl unzip

# Step 2: Download the AWS CLI installer
echo "Downloading AWS CLI installer..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Step 3: Unzip the AWS CLI installer
echo "Unzipping AWS CLI installer..."
unzip -o awscliv2.zip

# Step 4: Run the AWS CLI installer
echo "Running the AWS CLI installer..."
sudo ./aws/install

# Step 5: Verify the installation
echo "Verifying AWS CLI installation..."
aws --version || { echo "AWS CLI installation failed!"; exit 1; }

# Step 6: Clean up
echo "Cleaning up installation files..."
rm -rf awscliv2.zip aws/

echo "AWS CLI installation completed successfully!"

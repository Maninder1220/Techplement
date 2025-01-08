#!/bin/bash

# Script to install Terraform and essential tools on Ubuntu
set -e

echo "Starting setup for Terraform and dependencies..."

# Update package list
echo "Updating package list..."
sudo apt update && sudo apt upgrade -y

# Install required dependencies: curl, unzip, git, vim, awscli, and Docker
echo "Installing required dependencies: curl, unzip, vim, ..."
sudo apt install -y curl unzip vim nano apt-transport-https

# Install HashiCorp GPG Key and add repository
echo "Adding HashiCorp GPG key and repository for Terraform..."
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Update and install Terraform
echo "Updating package list and installing Terraform..."
sudo apt update -y
sudo apt install -y terraform

# Verify Terraform installation
echo "Verifying Terraform installation..."
terraform version || { echo "Terraform installation failed!"; exit 1; }

# Enable Terraform auto-completion
echo "Enabling Terraform tab completion..."
terraform -install-autocomplete

# Clean up any temporary files if needed
echo "Setup completed successfully. Please restart your terminal to apply changes."

#!/bin/bash

# This script installs Jenkins and Terraform with hardcoded versions.
# It is designed to be used as a user_data script in Terraform with templatefile.

# Update package lists
sudo apt-get update

# Install Java 17 (Jenkins requires Java 11, 17, or 21)
yes | sudo apt install openjdk-17-jdk-headless fontconfig -y

# Install Jenkins
# Add the Jenkins repository key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add the Jenkins apt repository entry
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package lists again to include Jenkins repository
sudo apt-get update

# Install Jenkins (hardcoded to the latest stable version from the repository)
yes | sudo apt-get install jenkins -y

# Install Terraform (hardcoded version - direct download URL)
# Using Terraform version 1.12.2 as an example, update as needed
wget https://releases.hashicorp.com/terraform/1.12.2/terraform_1.12.2_linux_amd64.zip

# Install unzip
yes | sudo apt-get install unzip -y

# Unzip the Terraform executable
unzip terraform_1.12.2_linux_amd64.zip # Hardcoded zip file name

# Move the Terraform executable to a directory in your PATH
sudo mv terraform /usr/local/bin/

# Clean up the zip file
rm terraform_1.12.2_linux_amd64.zip # Hardcoded zip file name

# Optional: Verify installations
echo "--- Verifying Jenkins installation ---"
systemctl status jenkins

echo "--- Verifying Terraform installation ---"
terraform version

#!/bin/bash
set -e

echo "Installing prerequisites..."
sudo apt-get update
sudo apt-get install -y gnupg software-properties-common wget lsb-release

echo "Adding HashiCorp GPG key..."
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

echo "Adding HashiCorp repository..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com focal main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

echo "Updating apt cache..."
sudo apt-get update

echo "Installing Terraform..."
sudo apt-get install -y terraform

terraform version


##### install aws-cli ####

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version

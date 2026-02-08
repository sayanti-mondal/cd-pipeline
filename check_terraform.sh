#!/bin/bash
set -e

TERRAFORM_VERSION="1.6.6"

if command -v terraform >/dev/null 2>&1; then
  echo "Terraform already installed:"
  terraform version
else
  echo "Terraform not found. Installing..."

  sudo apt-get update
  sudo apt-get install -y wget unzip

  wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
  unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
  sudo mv terraform /usr/local/bin/
  sudo chmod +x /usr/local/bin/terraform

  terraform version
fi

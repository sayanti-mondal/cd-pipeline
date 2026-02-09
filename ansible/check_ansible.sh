#!/bin/bash
set -e

echo "Checking Ansible..."
if ! command -v ansible >/dev/null 2>&1; then
    echo "Ansible not found. Installing..."
    sudo apt-get update
    sudo add-apt-repository -y ppa:ansible/ansible
    sudo apt update
    sudo apt install -y ansible-core

else
    echo "Ansible already installed"
fi

echo "Installing AWS inventory dependencies..."
pip3 install --user boto3 botocore

echo "Ansible version:"
ansible --version

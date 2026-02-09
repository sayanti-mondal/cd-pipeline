#!/bin/bash
set -e

echo "Checking Ansible..."
if ! command -v ansible >/dev/null 2>&1; then
    echo "Ansible not found. Installing..."
    sudo apt update
    sudo apt install -y software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible python3-pip
else
    echo "Ansible already installed"
fi

echo "Installing AWS inventory dependencies..."
pip3 install --user boto3 botocore

echo "Ansible version:"
ansible --version

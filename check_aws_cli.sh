#!/bin/bash
set -e

echo "Checking AWS CLI installation..."

if command -v aws >/dev/null 2>&1; then
  echo "✅ AWS CLI already installed"
  aws --version
else
  echo "❌ AWS CLI not found. Installing AWS CLI v2..."

  sudo apt-get update
  sudo apt-get install -y curl unzip

  curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip -q awscliv2.zip
  sudo ./aws/install

  echo "AWS CLI installed successfully"
  aws --version
fi

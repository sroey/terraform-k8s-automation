#!/bin/bash
set -e

echo "=== Installing Prerequisites ==="

# Docker
echo "Installing Docker..."
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
echo "Docker installed: $(docker --version)"

# kubectl
echo "Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl && sudo mv kubectl /usr/local/bin/
echo "kubectl installed: $(kubectl version --client)"

# k3d
echo "Installing k3d..."
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
echo "k3d installed: $(k3d version)"

# Terraform
echo "Installing Terraform..."
wget -q https://releases.hashicorp.com/terraform/1.14.5/terraform_1.14.5_linux_amd64.zip
unzip -o terraform_1.14.5_linux_amd64.zip && sudo mv terraform /usr/local/bin/
rm -f terraform_1.14.5_linux_amd64.zip
echo "Terraform installed: $(terraform version)"

echo ""
echo "=== All prerequisites installed successfully ==="

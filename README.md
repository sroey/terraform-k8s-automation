# Terraform K8s Automation

Deploy multiple web applications to a local Kubernetes cluster using Terraform and k3d.

## Prerequisites

### Docker

```bash
# Install Docker
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER && newgrp docker
docker --version
```

### kubectl

```bash
curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl && sudo mv kubectl /usr/local/bin/
kubectl version --client
```

### k3d

```bash
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
k3d version
```

### Terraform

```bash
wget https://releases.hashicorp.com/terraform/1.8.0/terraform_1.8.0_linux_amd64.zip
unzip terraform_1.8.0_linux_amd64.zip && sudo mv terraform /usr/local/bin/
terraform version
```

## Create the Cluster

```bash
k3d cluster create my-cluster -p "8080:80@loadbalancer"
```

This creates a local k3d cluster with port `8080` mapped to the ingress controller.

Verify the cluster is running:

```bash
kubectl get nodes
```

## Deploy

```bash
terraform init
terraform apply
```

Review the plan and type `yes` to confirm.

## Test

Check that pods and services are running:

```bash
kubectl get deployments
kubectl get pods
kubectl get services
kubectl get ingress
```

Access the applications via the ingress paths:

```bash
curl http://localhost:8080/webapp-primary
curl http://localhost:8080/webapp-beta
```

## Destroy

Tear down the Terraform resources:

```bash
terraform destroy
```

Delete the k3d cluster:

```bash
k3d cluster delete my-cluster
```

## Project Structure

```
├── main.tf             # Root module — instantiates web_app for each app config
├── variables.tf        # Input variables (kubeconfig path, app configs)
├── terraform.tfvars    # Default variable values
├── outputs.tf          # Output URLs
├── provider.tf         # Kubernetes provider configuration
└── modules/
    └── web_app/
        ├── main.tf     # Deployment, Service, and Ingress resources
        ├── variables.tf
        └── outputs.tf
```

## Application Deployment on Azure AKS with GitHub Actions and Terraform

### Table of Contents
- [Overview](#overview)
- [Deployment Workflow](#deployment-workflow)
- [After Deployment](#after-deployment)


### Overview

This repository provides an automated workflow for deploying an application to an Azure Kubernetes Service (AKS) cluster using Terraform, Helm, and GitHub Actions. The setup includes:

Terraform: Provisions the AKS cluster.

Helm: Manages application deployment on AKS.

GitHub Actions: Automates CI/CD to build, push, and deploy the application.

Docker: Packages the application into a Docker image.

Python Application: The source code of the deployed application. It creates an API for our website

### Note on Permissions:
Due to limited permissions, I was unable to create roles and service principals directly. Instead, this setup leverages Kubeconfig for connecting to the cluster and pull secret for ACR connection. 

## Deployment Workflow

### Prerequisites

1. Resource Group
2. Storage Account
3. Container in the Storage Account
4. ACR instance (and an access token to it)

Make sure to update the terraform values file accordingly.

### 1. Provision Infrastructure with Terraform

Terraform is used to create the AKS cluster. It also updates a GitHub Secret with the cluster's kubeconfig.
Pay attention - you should create a personal access token in GitHub so terraform can access the repo and update the cluster's Kubeconfig.

cd terraform
terraform init
terraform apply -var "github_token=<GITHUB-TOKEN>"

### 2. Configure GitHub Secrets

Ensure the following secrets are configured in GitHub:

AZURE_URL: URL of the ACR instance.

ACR_ACCESS_TOKEN: Token for ACR authentication.


### 3. Create Pull Secret

In order to access the ACR from the AKS cluster, you should create a pull sercret that contains the ACR token you created earlier.

kubectl create secret docker-registry acr-pull-secret --docker-server=<ACR> --docker-username=<NAME> --docker-password="<TOKEN>" --namespace <YOUR-NAMESPACE>


### 4. CI/CD Pipeline Execution

The GitHub Actions workflow automates:

Checking out the repository

Setting up the kubeconfig

Building and pushing the Docker image to ACR

Deploying the application to AKS using Helm

Running the Application

## Done !

# After Deployment

### Accessing the Cluster

Retrieve the kubeconfig and connect to AKS:

az aks get-credentials --resource-group <RESOURCE-GROUP> --name <AKS-CLUSTER-NAME>

### Verify Deployment

kubectl get pods -n <YOUR-NAMESPACE>
kubectl get services -n <YOUR-NAMESPACE>

### Access The Application

kubectl get svc -n <YOUR-NAMESPACE>

Get the service's IP address and browse to your application.

### Change data

If you wish to change the data shown in the website, edit the configmap in the helm chart.

# AKS Deployment with GitHub Actions and Terraform

## Table of Contents
- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Deployment Workflow](#deployment-workflow)
  - [Provision Infrastructure with Terraform](#1-provision-infrastructure-with-terraform)
  - [Configure GitHub Secrets](#2-configure-github-secrets)
  - [CI/CD Pipeline Execution](#3-cicd-pipeline-execution)
- [Running the Application](#running-the-application)
  - [Accessing the Cluster](#1-accessing-the-cluster)
  - [Deploy the Helm Chart Manually](#2-deploy-the-helm-chart-manually)
  - [Verify Deployment](#3-verify-deployment)
- [Cleanup](#cleanup)
- [Contributions](#contributions)
- [License](#license)



AKS Deployment with GitHub Actions and Terraform

Overview

This repository provides an automated workflow for deploying an application to an Azure Kubernetes Service (AKS) cluster using Terraform, Helm, and GitHub Actions. The setup includes:

Terraform: Provisions the AKS cluster and configures Azure Container Registry (ACR) integration.

Helm: Manages application deployment on AKS.

GitHub Actions: Automates CI/CD to build, push, and deploy the application.

Docker: Packages the application into a container image.

Python Application: The source code of the deployed application.

Deployment Workflow

1. Provision Infrastructure with Terraform

Terraform is used to create the AKS cluster and configure access to ACR. It also updates GitHub Secrets with the cluster's kubeconfig.

cd terraform
terraform init
terraform apply -auto-approve

2. Configure GitHub Secrets

Ensure the following secrets are configured in GitHub:

AZURE_CREDENTIALS: Service principal credentials for Azure.

AZURE_URL: URL of the ACR instance.

ACR_ACCESS_TOKEN: Token for ACR authentication.

KUBECONFIG_DATA: Base64-encoded kubeconfig file for AKS access.

3. CI/CD Pipeline Execution

The GitHub Actions workflow automates:

Checking out the repository

Setting up the kubeconfig

Building and pushing the Docker image to ACR

Deploying the application to AKS using Helm

The pipeline triggers on push to main and pull requests.

Running the Application

1. Accessing the Cluster

Retrieve the kubeconfig and connect to AKS:

echo "${{ secrets.KUBECONFIG_DATA }}" | base64 --decode > kubeconfig
export KUBECONFIG=$(pwd)/kubeconfig
kubectl get nodes

2. Deploy the Helm Chart Manually

helm upgrade --install myapp ./chart --namespace default --wait --timeout 5m

3. Verify Deployment

kubectl get pods -n default
kubectl get services -n default


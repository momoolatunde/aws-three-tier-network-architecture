# 3 Tier AWS Infrastructure Deployment Using Terraform and GitHub Actions

This repository contains Terraform configurations and a GitHub Actions workflow specifically designed for deploying a robust 3-tier AWS infrastructure. The architecture includes a Virtual Private Cloud (VPC), NAT gateways, subnets, and Internet gateways. This setup is organised into three tiers, each residing in separate subnets to enhance security and performance. This multi-tier architecture is ideal for deploying scalable and highly available web applications.

## Prerequisites

Before you begin, ensure you have the following:

- An AWS account with the necessary permissions to create the resources.
- GitHub account.
- Terraform installed locally for testing (optional).

## Repository Structure

- `/.github/workflows/deploy.yml`: CI/CD pipeline using GitHub Actions.
- `/modules`: Terraform modules for VPC and NAT Gateway.
- `/pre`: Terraform configurations for backend setup.
- `main.tf`: Main Terraform configuration file.
- `variables.tf`: Terraform variables definition.
- `terraform.tfvars`: Terraform variables file.
- `provider.tf`: Terraform provider configuration.
- `backend.tf`: Terraform backend configuration for state management.

## GitHub Actions Secrets

Configure the following secrets in your GitHub repository:

- `AWS_ACCESS_KEY_ID`: Your AWS access key.
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.

## Deployment Steps

### 1. Fork and Clone the Repository

Fork this repository and clone it to your local machine:

```bash
git clone <your-repository-url>
cd <your-repository-directory>
```

## 2. Configure AWS Credentials (Locally)

For local testing, configure your AWS credentials:

```bash
aws configure
```

## 3. Review and Update Terraform Variables

Edit `terraform.tfvars` to match your AWS environment and requirements.

## 4. Initialise Terraform (Locally)

Initialise Terraform to download required plugins:

```bash
terraform init
```

## 5. Test Terraform Configurations (Locally)

Validate and plan to see the changes:

```bash
terraform validate
terraform plan
```

## 6. Push Changes to GitHub

Commit your changes and push them to your GitHub repository:

```bash
git add .
git commit -m "Initial AWS infrastructure setup"
git push origin main
```

## 7. Monitor GitHub Actions Workflow

Go to the 'Actions' tab in your GitHub repository to monitor the workflow execution.

## 8. Access AWS Console

Once the workflow is complete, check your AWS console to verify the infrastructure deployment.

## Destroying Infrastructure

To destroy the infrastructure, follow these steps:

1. **Manual Destruction**:

   - Comment out or remove the `delayed-destroy` job in the `.github/workflows/deploy.yml` file. This job is configured to automatically destroy the infrastructure 10 minutes after deployment.
   - Push the changes to GitHub to apply this update to the workflow.
   - The infrastructure will remain intact until manually destroyed.

2. **Using Delayed-Destroy Job**:
   - If you leave the `delayed-destroy` job as is in the workflow, the infrastructure will be automatically destroyed 10 minutes after deployment. This is useful for temporary or test environments.
   - Monitor the GitHub Actions workflow to confirm the destruction of the resources.

Remember, the `delayed-destroy` job is a significant aspect of this workflow, specifically for scenarios where temporary infrastructure is required. Adjust the workflow according to your project needs.

# Terraform block to specify the required provider and its version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.33.0"
    }
  }
}

# AWS provider configuration specifying the AWS region
provider "aws" {
    region = "eu-north-1"
}
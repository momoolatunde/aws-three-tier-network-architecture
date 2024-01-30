# Terraform backend configuration to use an S3 bucket for state storage and a DynamoDB table for state locking
terraform {
    backend "s3" {
        key            = "state/terraform.tfstate"
        bucket         = "tf-state-3-tier-arch"
        dynamodb_table = "tf-lock-3-tier-arch"
        region         = "eu-north-1"
        encrypt        = true
    }
}

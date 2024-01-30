# Module instantiation for creating the VPC and its associated subnets
module "vpc" {
  source                     = "./modules/vpc"
  vpc_cidr_block             = var.vpc_cidr_block
  subnet_cidr_block          = var.subnet_cidr_block
  web_subnet_cidr_block      = var.web_subnet_cidr_block
  database_subnet_cidr_block = var.database_subnet_cidr_block
}

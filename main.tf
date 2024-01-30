# Module instantiation for creating the VPC and its associated subnets
module "vpc" {
  source                     = "./modules/vpc"
  vpc_cidr_block             = var.vpc_cidr_block
  subnet_cidr_block          = var.subnet_cidr_block
  web_subnet_cidr_block      = var.web_subnet_cidr_block
  database_subnet_cidr_block = var.database_subnet_cidr_block
  nat_gateway_ids            = module.nat.nat_gateway_ids
}

# Module for creating NAT gateways with associated Elastic IPs in specified subnets
module "nat" {
  source              = "./modules/nat"
  elastic_ip_names    = var.elastic_ip_names
  nat_gateway_names   = var.nat_gateway_names
  subnets_ids         = module.vpc.subnets_ids
  internet_gateway_id = module.vpc.internet_gateway_id
}


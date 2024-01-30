# CIDR Block Assignments for VPC and Subnet Configurations

# CIDR block for the main VPC
vpc_cidr_block = "10.0.0.0/16"

# CIDR blocks for public subnets in the VPC
subnet_cidr_block = ["10.0.1.0/24", "10.0.3.0/24"]

# CIDR blocks for web subnets in the VPC
web_subnet_cidr_block = ["10.0.2.0/24", "10.0.4.0/24"]

# CIDR blocks for database subnets in the VPC
database_subnet_cidr_block = ["10.0.6.0/24", "10.0.8.0/24"]
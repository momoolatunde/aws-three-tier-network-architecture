# -- Virtual Private Cloud -- #

# Resource for creating the main VPC with specified CIDR block
resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "MainVPC-3TierArch"
    Environment = "Development"
    Description = "VPC for 3-Tier Architecture"
    ManagedBy   = "Terraform"
  }
}

# -- Internet Gateway -- #

# Resource for creating an Internet Gateway attached to the main VPC
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name        = "IGW-3TierArch"
    Environment = "Development"
    Description = "Internet Gateway for Main VPC"
    ManagedBy   = "Terraform"
  }
}

# -- Subnets -- #

# Subnet resource for creating multiple public subnets in the main VPC
resource "aws_subnet" "subnets" {
  count                   = length(var.subnet_cidr_block)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet_cidr_block[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = var.subnet_names[count.index]
    Environment = "Development"
    ManagedBy   = "Terraform"
    Type        = "Public"
    Description = "Public subnets in the main VPC"
  }
}

# Route table for managing traffic routing within the main VPC
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name        = "PublicRouteTable"
    Environment = "Development"
    ManagedBy   = "Terraform"
    Description = "Route table for public subnets traffic routing"
  }
}

# Association of public subnets with the public route table
resource "aws_route_table_association" "route_table_association" {
  count          = length(var.subnet_cidr_block)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.route_table.id

}

# -- Web Subnets -- #

# Subnet resource for creating private web subnets in the main VPC
resource "aws_subnet" "web_subnets" {
  count                   = length(var.web_subnet_cidr_block)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.web_subnet_cidr_block[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name        = var.web_subnet_names[count.index]
    Environment = "Development"
    ManagedBy   = "Terraform"
    Type        = "Private"
    Description = "Private web subnets in the main VPC"
  }
}

# -- Database Subnets -- #

# Subnet resource for creating private database subnets in the main VPC
resource "aws_subnet" "database_subnets" {
  count                   = length(var.database_subnet_cidr_block)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.database_subnet_cidr_block[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name        = var.database_subnet_names[count.index]
    Environment = "Development"
    ManagedBy   = "Terraform"
    Type        = "Private"
    Description = "Private satabase subnets in the main VPC"
  }
}


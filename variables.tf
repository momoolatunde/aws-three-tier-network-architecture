# Variable for defining the CIDR block of the main VPC
variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
}

# Variable for defining the CIDR blocks of public subnets
variable "subnet_cidr_block" {
  type        = list(string)
  description = "The CIDR block for the public subnets."
}

# Variable for defining the CIDR blocks of web subnets
variable "web_subnet_cidr_block" {
  type        = list(string)
  description = "The CIDR block for the web subnets."
}

# Variable for defining the CIDR blocks of database subnets
variable "database_subnet_cidr_block" {
  type        = list(string)
  description = "The CIDR block for the database subnets."
}

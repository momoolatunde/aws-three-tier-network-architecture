# Elastic IP names for the NAT Gateways
variable "elastic_ip_names" {
  type        = list(string)
  description = "Names for the Elastic IPs"
  default     = ["ElasticIP1", "ElasticIP2"]
}

# NAT Gateway names
variable "nat_gateway_names" {
  type        = list(string)
  description = "Names for the NAT Gateways"
  default     = ["NatGateway1", "NatGateway2"]
}

# Subnet IDs for deploying the NAT gateways
variable "subnets_ids" {
  type        = list(string)
  description = "List of subnet IDs where the NAT gateways will be deployed"
}

# Internet Gateway ID associated with the VPC
variable "internet_gateway_id" {
  type        = string
  description = "The ID of the main Internet Gateway associated with the VPC"
}

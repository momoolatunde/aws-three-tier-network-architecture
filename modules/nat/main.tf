# Resource block to create Elastic IPs
resource "aws_eip" "eips" {
  count  = length(var.elastic_ip_names)
  domain = "vpc"

  tags = {
    Name        = var.elastic_ip_names[count.index]
    Environment = "Development"
    Description = "Elastic IP for NAT Gateway"
    ManagedBy   = "Terraform"
  }
}

# Resource block to create NAT Gateways
resource "aws_nat_gateway" "nat_gateway" {
  count         = length(var.nat_gateway_names)
  allocation_id = aws_eip.eips[count.index].id
  subnet_id     = var.subnets_ids[count.index]

  tags = {
    Name        = var.nat_gateway_names[count.index]
    Environment = "Development"
    Description = "NAT Gateway for routing internal traffic"
    ManagedBy   = "Terraform"
  }
}

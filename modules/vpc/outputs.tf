# Output the ID of the main VPC
output "main_vpc_id" {
  value = aws_vpc.main_vpc.id
}

# Output the IDs of the public subnets
output "subnets_ids" {
  value = aws_subnet.subnets.*.id
}

# Output the IDs of the web subnets
output "web_subnet_ids" {
  value = aws_subnet.web_subnets.*.id
}

# Output the IDs of the database subnets
output "database_subnet_ids" {
  value = aws_subnet.database_subnets.*.id
}

# Output the ID of the Internet Gateway
output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
}

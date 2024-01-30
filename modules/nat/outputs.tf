# Output for Elastic IP addresses created in the NAT module
output "elastic_ip_addresses" {
  value = aws_eip.eips.*.public_ip
}

# Output for NAT Gateway IDs created in the NAT module
output "nat_gateway_ids" {
  value = aws_nat_gateway.nat_gateway.*.id
}

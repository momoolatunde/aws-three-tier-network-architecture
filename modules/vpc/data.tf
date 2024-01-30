# Data source to fetch the list of available AWS Availability Zones
data "aws_availability_zones" "available" {
  state = "available"
}



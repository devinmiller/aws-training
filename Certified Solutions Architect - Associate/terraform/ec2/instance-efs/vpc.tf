
# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Get the default subnet ids
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Get a list of availability zones
data "aws_availability_zones" "availability_zones" {
  state = "available"
}

# Get a subnet to work with
data "aws_subnet" "selected" {
  availability_zone_id = data.aws_availability_zones.availability_zones.zone_ids[0]
}

output "vpc" {
  value = {
    subnet = data.aws_subnet.selected.id
  }
}
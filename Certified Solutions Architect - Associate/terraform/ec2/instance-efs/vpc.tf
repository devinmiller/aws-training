
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
data "aws_subnet" "zone_one" {
  availability_zone_id = data.aws_availability_zones.availability_zones.zone_ids[0]
  default_for_az = true
}

# Get a subnet to work with
data "aws_subnet" "zone_two" {
  availability_zone_id = data.aws_availability_zones.availability_zones.zone_ids[1]
  default_for_az = true
}

output "vpc" {
  value = {
    subnet_one = data.aws_subnet.zone_one.id
    subnet_two = data.aws_subnet.zone_two.id
  }
}
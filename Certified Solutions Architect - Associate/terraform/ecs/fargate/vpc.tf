locals {
  cidr_blocks = [
    "172.20.1.0/24",
    "172.20.2.0/24",
    "172.20.3.0/24"
  ]
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "cotb_dev_lab_vpc" {
  # The CIDR block for the VPC
  cidr_block = "172.20.0.0/16"

  tags = {
    "Name" = "cotb-dev-lab-vpc"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "cotb_dev_lab_igw" {
  # The VPC ID to create in
  vpc_id = aws_vpc.cotb_dev_lab_vpc.id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "cotb_dev_lab_subnets" {
  count = 3

  # The VPC ID
  vpc_id     = aws_vpc.cotb_dev_lab_vpc.id
  # The CIDR block for the subnet
  cidr_block = local.cidr_blocks[count.index]
  # The AZ for the subnet
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]
  # Specify true to indicate that instances launched into the subnet should be assigned a public IP address
  map_public_ip_on_launch = false # Default is false

  tags = {
    Name = "cotb-dev-lab-${count.index}"
  }
}
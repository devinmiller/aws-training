locals {
  public_cidr_blocks = [
    "172.20.1.0/24",
    "172.20.2.0/24",
    "172.20.3.0/24"
  ]
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "aws_opsworks_vpc" {
  # The CIDR block for the VPC
  cidr_block            = "172.20.0.0/16"
  # A boolean flag to enable/disable DNS support in the VPC
  enable_dns_support    = true # Default true
  # A boolean flag to enable/disable DNS hostnames in the VPC
  enable_dns_hostnames  = true # Default false

  tags = {
    "Name" = "aws-opsworks-vpc"
  }
}

output "aws_opsworks_vpc" {
    value = {
        id = aws_vpc.aws_opsworks_vpc.id
        arn = aws_vpc.aws_opsworks_vpc.arn
    }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "aws_opsworks_igw" {
  # The VPC ID to create in
  vpc_id = aws_vpc.aws_opsworks_vpc.id

  tags = {
    Name = "aws-opsworks-igw"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "aws_opsworks_public_subnets" {
  count = 3

  # The VPC ID
  vpc_id     = aws_vpc.aws_opsworks_vpc.id
  # The CIDR block for the subnet
  cidr_block = local.public_cidr_blocks[count.index]
  # The AZ for the subnet
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]
  # Specify true to indicate that instances launched into the subnet should be assigned a public IP address
  map_public_ip_on_launch = true # Default is false

  tags = {
    Name = "aws-opsworks-public-${count.index}"
  }
}
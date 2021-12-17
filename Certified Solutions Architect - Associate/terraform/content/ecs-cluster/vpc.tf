locals {
  public_cidr_blocks = [
    "172.20.1.0/24",
    "172.20.2.0/24",
    "172.20.3.0/24"
  ]
  private_cidr_blocks = [
    "172.20.4.0/24",
    "172.20.5.0/24",
    "172.20.6.0/24"
  ]
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "cotb_cluster_vpc" {
  # The CIDR block for the VPC
  cidr_block            = "172.20.0.0/16"
  # A boolean flag to enable/disable DNS support in the VPC
  enable_dns_support    = true # Default true
  # A boolean flag to enable/disable DNS hostnames in the VPC
  enable_dns_hostnames  = true # Default false

  tags = {
    "Name" = "cotb-cluster-vpc"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "cotb_cluster_igw" {
  # The VPC ID to create in
  vpc_id = aws_vpc.cotb_cluster_vpc.id

  tags = {
    Name = "cotb-cluster-igw"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "cotb_cluster_public_subnets" {
  count = 3

  # The VPC ID
  vpc_id     = aws_vpc.cotb_cluster_vpc.id
  # The CIDR block for the subnet
  cidr_block = local.public_cidr_blocks[count.index]
  # The AZ for the subnet
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]
  # Specify true to indicate that instances launched into the subnet should be assigned a public IP address
  map_public_ip_on_launch = false # Default is false

  tags = {
    Name = "cotb-cluster-public-${count.index}"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "cotb_cluster_private_subnets" {
  count = 3

  # The VPC ID
  vpc_id     = aws_vpc.cotb_cluster_vpc.id
  # The CIDR block for the subnet
  cidr_block = local.private_cidr_blocks[count.index]
  # The AZ for the subnet
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]
  # Specify true to indicate that instances launched into the subnet should be assigned a public IP address
  map_public_ip_on_launch = false # Default is false

  tags = {
    Name = "cotb-cluster-private-${count.index}"
  }
}
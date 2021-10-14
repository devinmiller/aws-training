terraform {
  backend "s3" {
    bucket          = "cotb.terraform"
    key             = "aws-training/vpc/basic.tfstate"
    dynamodb_table  = "aws_cotb_dev_terraform_state"
    region          = "us-west-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "cotb_dev_vpc" {
  # The CIDR block for the VPC
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "cotb-dev-vpc"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  # The VPC ID to create in
  vpc_id = aws_vpc.cotb_dev_vpc.id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "cotb_dev_subnet_private" {
  # The VPC ID
  vpc_id     = aws_vpc.cotb_dev_vpc.id
  # The CIDR block for the subnet
  cidr_block = "10.0.1.0/24"
  # The AZ for the subnet
  availability_zone = "us-west-2a"

  tags = {
    Name = "cotb-dev-private"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "cotb_dev_subnet_public" {
  # The VPC ID
  vpc_id     = aws_vpc.cotb_dev_vpc.id
  # The CIDR block for the subnet
  cidr_block = "10.0.2.0/24"
  # The AZ for the subnet
  availability_zone = "us-west-2b"
  # Specify true to indicate that instances launched into the subnet should be assigned a public IP address
  map_public_ip_on_launch = true # Default is false

  tags = {
    Name = "cotb-dev-public"
  }
}
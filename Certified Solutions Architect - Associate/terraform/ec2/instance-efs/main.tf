terraform {
  backend "s3" {
    bucket          = "cotb.terraform"
    key             = "aws-training/ec2/instance-ebs.tfstate"
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

variable ssh_key {
  type = string
  default = "cotb-ssh-key-pair"
  description = "Name of the SSH key pair to use with instance"
}

# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Get the default subnet ids
data "aws_subnet_ids" "default_ids" {
  vpc_id = data.aws_vpc.default.id
} 

resource "aws_efs_file_system" "cotb_dev_web_file_system" {
  # The file system performance mode.  Default is generalPurpose.
  performance_mode = "generalPurpose"
}

resource "aws_efs_mount_target" "file_system_mount_target" {
  for_each = data.aws_subnet_ids.default_ids.ids
  # The ID of the file system for which the mount target is intended.
  file_system_id = aws_efs_file_system.cotb_dev_web_file_system.id
  # The ID of the subnet to add the mount target in.
  subnet_id      = each.value
}
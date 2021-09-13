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

variable hibernate {
  type = bool
  default = false
  description = "Enable/Disble EC2 instance hibernation"
}

resource "aws_efs_file_system" "cotb_dev_web_file_system" {
  # The file system performance mode.  Default is generalPurpose.
  performance_mode = "generalPurpose"
}

resource "aws_efs_mount_target" "file_system_mount_target" {
  # The ID of the file system for which the mount target is intended.
  file_system_id  = aws_efs_file_system.cotb_dev_web_file_system.id
  # A list of up to 5 VPC security group IDs in effect for the mount target.
  security_groups = [ aws_security_group.cotb_dev_web_sg.id ]
  # The ID of the subnet to add the mount target in.
  subnet_id       = data.aws_subnet.selected.id
}

output "efs" {
  value = {
    id = aws_efs_mount_target.file_system_mount_target.id
  }
}
terraform {
  backend "s3" {
    bucket          = "cotb.terraform"
    key             = "aws-training/content/chef-opsworks/state.tfstate"
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

# resource "aws_opsworks_stack" "main" {
#   name                         = "chef-opswork-stack"
#   region                       = "us-west-2"
#   service_role_arn             = aws_iam_role.aws_opsworks_service_role.arn
#   default_instance_profile_arn = aws_iam_instance_profile.aws_opsworks_ec2_profile.arn

#   # The id of the VPC that this stack belongs to.
#   vpc_id                       = aws_vpc.aws_opsworks_vpc.id
#   # Id of the subnet in which instances will be created by default.
#   default_subnet_id            =  aws_subnet.aws_opsworks_public_subnets[0].id

#   # Version of the configuration manager to use.
#   configuration_manager_version = "12"
#   # Boolean value controlling whether Opsworks will run Berkshelf for this stack.
#   manage_berkshelf              = true 
#   # Name of OS that will be installed on instances by default.
#   default_os                    = "Red Hat Enterprise Linux 7"
# }
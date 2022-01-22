terraform {
  backend "s3" {
    bucket          = "cotb.terraform"
    key             = "aws-training/content/ecs/tasks.tfstate"
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
  default = "work-ssh-key-pair"
  description = "Name of the SSH key pair to use with instance"
}

data "terraform_remote_state" "cluster" {  
  backend = "s3"
  config = {    
    bucket          = "cotb.terraform"  
    key             = "aws-training/content/ecs/cluster.tfstate"
    dynamodb_table  = "aws_cotb_dev_terraform_state"
    region          = "us-west-2"
  }
}

data "terraform_remote_state" "instances" {  
  backend = "s3"
  config = {    
    bucket          = "cotb.terraform"  
    key             = "aws-training/content/ecs/instances.tfstate"
    dynamodb_table  = "aws_cotb_dev_terraform_state"
    region          = "us-west-2"
  }
}
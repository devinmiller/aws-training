terraform {
  backend "s3" {
    bucket          = "cotb.terraform"
    key             = "aws-training/db/rds-basic.tfstate"
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

variable multi_az {
  type = bool
  default = false
  description = "Specifies if the RDS instance is multi-AZ."
}

resource "aws_db_instance" "cotb_dev_mysql_db" {
  # The allocated storage in gibibytes.
  allocated_storage    = 10
  # The database engine to use. 
  engine               = "mysql"
  # The engine version to use.
  engine_version       = "5.7"
  # The name of the RDS instance
  identifier           = "cotb-dev-db"
  # The instance type of the RDS instance.
  instance_class       = "db.t3.micro"
  # The name of the database to create when the DB instance is created.
  name                 = "demo"
  # Specifies if the RDS instance is multi-AZ
  multi_az             = var.multi_az 
  # Username for the master DB user.
  username             = "foo"
  # Password for the master DB user.
  password             = "foobarbaz"
  # Name of the DB parameter group to associate.
  parameter_group_name = "default.mysql5.7"
  # Determines whether a final DB snapshot is created before the DB instance is deleted.
  skip_final_snapshot  = true
}
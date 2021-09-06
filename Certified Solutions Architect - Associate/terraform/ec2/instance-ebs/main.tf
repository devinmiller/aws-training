# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
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

locals {
  user_data = <<EOF
#!/bin/bash
export PATH=$PATH:/usr/local/bin
# install nginx from Amazon repo
amazon-linux-extras install nginx1 -y
# make sure nginx service is started
systemctl start nginx
# change the default HTML page
cat > /usr/share/nginx/html/index.html <<DOC
<html>
  <body>
    <h1>nginx is running on cotb-dev-web-01</h1>
  </body>
</html>
DOC
EOF
}

# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Find the Amazon Linux 2 AMI
data "aws_ami" "amz_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Amazon
}

# Create a security in the default VPC
resource "aws_security_group" "cotb_dev_web_sg" {
  name = "cotb-dev-web-sg"
  vpc_id = data.aws_vpc.default.id
}

# Create an inbound rule allowing SSH traffic
resource "aws_security_group_rule" "allow_ssh_in" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_web_sg.id
}

# Create an inbound rule allowing HTTP traffic
resource "aws_security_group_rule" "allow_http_in" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_web_sg.id
}

# create an outbound rule allowing all traffic
resource "aws_security_group_rule" "allow_all_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_web_sg.id
}

resource "aws_instance" "cotb_dev_web_01" {
  # AMI to use for the instance.
  ami                         = data.aws_ami.amz_linux.id
  # Whether to associate a public IP address with an instance in a VPC
  associate_public_ip_address = true
  # If true, enables EC2 Instance Termination Protection (defaults to false)
  disable_api_termination     = false 
  #  If true, the launched EC2 instance will support hibernation
  hibernation                 = var.hibernate
  # The instance type to use for the instance
  instance_type               = "t3.micro"
  # Key name of the Key Pair to use for the instance
  key_name                    = var.ssh_key
  #  User data to provide when launching the instance
  user_data_base64            = base64encode(local.user_data) 
  #  A list of security group IDs to associate with
  vpc_security_group_ids = [ aws_security_group.cotb_dev_web_sg.id ]

  root_block_device {
    # Whether the volume should be destroyed on instance termination
    # Defaults to true for the root volume
    delete_on_termination = true
    # Size of the volume in gibibytes
    volume_size = "8"
  }

  tags = {
    Name = "cotb-dev-web-01"
  }
}

output "ec2" {
  value = {
    "ami": data.aws_ami.amz_linux.id,
    "instance_arn": aws_instance.cotb_dev_web_01.arn
    "public_dns": aws_instance.cotb_dev_web_01.public_dns
    "public_ip": aws_instance.cotb_dev_web_01.public_ip
  }
}
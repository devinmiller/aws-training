terraform {
  backend "s3" {
    bucket          = "cotb.terraform"
    key             = "aws-training/ec2/instance-ami.tfstate"
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

provider "aws" {
  region = "us-east-2"
  alias = "east"
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

variable instance_name {
  type = string
  description = "The name of the instance to snapshot"
}

data "aws_instance" "configured_instance" {
  filter {
    name    = "tag:Name"
    values  = [var.instance_name]
  }
}

# Create snapshot of instance volume
resource "aws_ebs_snapshot" "cotb_dev_web_01_snapshot" {
  # The Volume ID of which to make a snapshot
  volume_id = tolist(data.aws_instance.configured_instance.root_block_device)[0].volume_id

  tags = {
    Name = "cotb-dev-web-01-snapshot"
  }
}

# Create an AMI from the snapshot
resource "aws_ami" "cotb_dev_web_ami" {
  # A region-unique name for the AMI
  name                = "cotb-dev-web-ami"
  # Keyword to choose what virtualization mode created instances will use
  virtualization_type = "hvm"
  # Specifies whether enhanced networking with ENA is enabled
  ena_support         = true
  # The name of the root device
  root_device_name    = "/dev/xvda"
  
  ebs_block_device {
    # The path at which the device is exposed to created instances
    device_name = "/dev/xvda"
    # The id of an EBS snapshot that will be used to initialize the created EBS volumes
    snapshot_id = aws_ebs_snapshot.cotb_dev_web_01_snapshot.id
    # The size of created volumes in GiB
    volume_size = 8
  }

  tags = {
    Name = "cotb-dev-web-ami"
  }
} 

# Copy AMI to a different region
resource "aws_ami_copy" "cotb_dev_web_ami_copy" {
  provider = aws.east

  # A region-unique name for the AMI
  name              = "cotb-dev-web-ami"
  description       = "A copy of ami-xxxxxxxx"
  # The id of the AMI to copy
  source_ami_id     = aws_ami.cotb_dev_web_ami.id
  # The region from which the AMI will be copied
  source_ami_region = "us-west-2"

  tags = {
    Name = "cotb-dev-web-ami"
  }
}

output "volume" {
  value = {
    volume_id = tolist(data.aws_instance.configured_instance.root_block_device)[0].volume_id
  }
}

output "snapshot" {
  value = {
    id = aws_ebs_snapshot.cotb_dev_web_01_snapshot.id
  }
}

output "ami" {
  value = {
    id = aws_ami.cotb_dev_web_ami.id
  }
}

output "ami-copy" {
  value = {
    id = aws_ami_copy.cotb_dev_web_ami_copy.id
  }
}
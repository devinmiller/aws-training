data "aws_ami" "amzn2_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Amazon
}

resource "aws_instance" "cotb_ssh_instance" {
  # AMI to use for the instance.
  ami                         = data.aws_ami.amzn2_ami.id
  # Whether to associate a public IP address with an instance in a VPC
  associate_public_ip_address = true
  # If true, enables EC2 Instance Termination Protection (defaults to false)
  disable_api_termination     = false 
  #  If true, the launched EC2 instance will support hibernation
  hibernation                 = false
  # The instance type to use for the instance
  instance_type               = "t3a.micro"
  # Key name of the Key Pair to use for the instance
  key_name                    = var.ssh_key
  # VPC Subnet ID to launch in
  subnet_id = data.terraform_remote_state.cluster.outputs.cotb_cluster_public_subnets[0]
  # A list of security group IDs to associate with
  vpc_security_group_ids = [ 
    data.terraform_remote_state.instances.outputs.cotb_cluster_ssh_sg
  ]

  root_block_device {
    # Whether the volume should be destroyed on instance termination
    # Defaults to true for the root volume
    delete_on_termination = true
    # Size of the volume in gibibytes
    volume_size = "30"
  }

  tags = {
    Name = "cotb-ssh-instance"
  }
}
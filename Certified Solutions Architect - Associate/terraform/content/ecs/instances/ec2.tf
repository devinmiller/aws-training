data "aws_ami" "amzn2_ami_ecs" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["591542846629"] # Amazon
}

resource "aws_instance" "cotb_cluster_instance" {
  count = 3

  # AMI to use for the instance.
  ami                         = data.aws_ami.amzn2_ami_ecs.id
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
  subnet_id = data.terraform_remote_state.cluster.outputs.cotb_cluster_public_subnets[count.index]
  # A list of security group IDs to associate with
  vpc_security_group_ids = [ aws_security_group.cotb_cluster_public_sg.id ]
  # IAM Instance Profile to launch the instance with.
  iam_instance_profile = aws_iam_instance_profile.cotb_cluster_ec2_ip.name

  user_data = <<-EOF
    #!/bin/bash
    echo ECS_CLUSTER=cotb-dev-cluster >> /etc/ecs/ecs.config
    EOF

  root_block_device {
    # Whether the volume should be destroyed on instance termination
    # Defaults to true for the root volume
    delete_on_termination = true
    # Size of the volume in gibibytes
    volume_size = "30"
  }

  tags = {
    Name = "cotb-cluster-instance-${count.index}"
  }
}
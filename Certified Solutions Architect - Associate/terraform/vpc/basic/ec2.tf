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

resource "aws_instance" "cotb_dev_web_instance" {
  # AMI to use for the instance.
  ami                         = data.aws_ami.amz_linux.id
  # Whether to associate a public IP address with an instance in a VPC
  associate_public_ip_address = true
  # If true, enables EC2 Instance Termination Protection (defaults to false)
  disable_api_termination     = false 
  # The instance type to use for the instance
  instance_type               = "t3.micro"
  # Key name of the Key Pair to use for the instance
  key_name                    = var.ssh_key
  #  User data to provide when launching the instance
  user_data_base64            = base64encode(templatefile("${path.module}/user-data.tpl", {name = "cotb-dev-web"}))
  # VPC Subnet ID to launch in
  subnet_id = aws_subnet.cotb_dev_subnet_public.id
  #  A list of security group IDs to associate with
  vpc_security_group_ids = [ aws_security_group.cotb_dev_web_sg.id ]

  root_block_device {
    # Whether the volume should be destroyed on instance termination
    # Defaults to true for the root volume
    delete_on_termination = true
    # Size of the volume in gibibytes
    volume_size = "8"
  }

  ebs_block_device {
    # Whether the volume should be destroyed on instance termination
    # Defaults to false for non-root volumes
    delete_on_termination = true
    # Name of the device to mount
    device_name = "/dev/sda1"
    # Size of the volume in gibibytes
    volume_size = "8"
  }

  tags = {
    Name = "cotb-dev-web-instance"
  }
}

resource "aws_instance" "cotb_dev_db_instance" {
  # AMI to use for the instance.
  ami                         = data.aws_ami.amz_linux.id
  # Whether to associate a public IP address with an instance in a VPC
  associate_public_ip_address = false
  # If true, enables EC2 Instance Termination Protection (defaults to false)
  disable_api_termination     = false 
  # The instance type to use for the instance
  instance_type               = "t3.micro"
  # Key name of the Key Pair to use for the instance
  key_name                    = var.ssh_key
  #  User data to provide when launching the instance
  user_data_base64            = base64encode(templatefile("${path.module}/user-data.tpl", {name = "cotb-dev-db"}))
  # VPC Subnet ID to launch in
  subnet_id = aws_subnet.cotb_dev_subnet_private.id
  #  A list of security group IDs to associate with
  vpc_security_group_ids = [ aws_security_group.cotb_dev_db_sg.id ]

  root_block_device {
    # Whether the volume should be destroyed on instance termination
    # Defaults to true for the root volume
    delete_on_termination = true
    # Size of the volume in gibibytes
    volume_size = "8"
  }

  ebs_block_device {
    # Whether the volume should be destroyed on instance termination
    # Defaults to false for non-root volumes
    delete_on_termination = true
    # Name of the device to mount
    device_name = "/dev/sda1"
    # Size of the volume in gibibytes
    volume_size = "8"
  }

  tags = {
    Name = "cotb-dev-db-instance"
  }
}
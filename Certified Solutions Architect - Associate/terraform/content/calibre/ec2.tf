data "aws_ami" "ubuntu_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-20210430"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "cotb_dev_web_calibre" {
  # AMI to use for the instance.
  ami                         = data.aws_ami.ubuntu_linux.id
  # Whether to associate a public IP address with an instance in a VPC
  associate_public_ip_address = true
  # If true, enables EC2 Instance Termination Protection (defaults to false)
  disable_api_termination     = false 
  # The instance type to use for the instance
  instance_type               = "t3.micro"
  # Key name of the Key Pair to use for the instance
  key_name                    = var.ssh_key
  #  User data to provide when launching the instance
  user_data_base64            = base64encode(templatefile("${path.module}/user-data.tpl", {nfs = aws_efs_file_system.cotb_dev_calibre_file_system.dns_name}))
  # VPC Subnet ID to launch in
  subnet_id = aws_subnet.cotb_dev_subnet_public.id
  #  A list of security group IDs to associate with
  vpc_security_group_ids = [ aws_security_group.cotb_dev_web_sg.id ]

  root_block_device {
    # Whether the volume should be destroyed on instance termination
    # Defaults to true for the root volume
    delete_on_termination = true
    # Size of the volume in gibibytes
    volume_size = "20"
  }

  tags = {
    Name = "cotb-dev-web-calibre"
  }
}
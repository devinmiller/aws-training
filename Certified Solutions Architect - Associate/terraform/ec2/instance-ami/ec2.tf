resource "aws_instance" "cotb_dev_web_01" {
  provider = aws.east

  # AMI to use for the instance.
  ami                         = aws_ami_copy.cotb_dev_web_ami_copy.id
  # Whether to associate a public IP address with an instance in a VPC
  associate_public_ip_address = true
  # If true, enables EC2 Instance Termination Protection (defaults to false)
  disable_api_termination     = false 
  #  If true, the launched EC2 instance will support hibernation
  hibernation                 = var.hibernate
  # The instance type to use for the instance
  instance_type               = "t3.micro"
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
    Name = "cotb-dev-web-01"
  }
}

output "ec2" {
  value = {
    "ami": aws_instance.cotb_dev_web_01.ami,
    "root_volume": aws_instance.cotb_dev_web_01.root_block_device.0.volume_id
    "instance_arn": aws_instance.cotb_dev_web_01.arn
    "public_dns": aws_instance.cotb_dev_web_01.public_dns
    "public_ip": aws_instance.cotb_dev_web_01.public_ip
  }
}
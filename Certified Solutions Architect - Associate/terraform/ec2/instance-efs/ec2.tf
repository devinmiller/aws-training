locals {
  user_data_01 = <<EOF
#!/bin/bash
export PATH=$PATH:/usr/local/bin
# install disk testing utility
yum install fio amazon-efs-utils -y
# install nginx from Amazon repo
amazon-linux-extras install nginx1 -y
# make sure nginx service is started
systemctl start nginx
# connect to EFS 
mount -t efs -o tls ${aws_efs_file_system.cotb_dev_web_file_system.id}:/ /usr/share/nginx/html
# change the default HTML page
cat > /usr/share/nginx/html/index.html <<DOC
<html>
  <body>
    <h1>nginx is running on cotb-dev-web AWS instances</h1>
  </body>
</html>
DOC
EOF
  user_data_02 = <<EOF
#!/bin/bash
export PATH=$PATH:/usr/local/bin
# install disk testing utility
yum install fio amazon-efs-utils -y
# install nginx from Amazon repo
amazon-linux-extras install nginx1 -y
# make sure nginx service is started
systemctl start nginx
# connect to EFS
mount -t efs -o tls ${aws_efs_file_system.cotb_dev_web_file_system.id}:/ /usr/share/nginx/html
EOF
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

# Create an inbound rule allowing NFS traffic
resource "aws_security_group_rule" "allow_nfs_in" {
  type              = "ingress"
  from_port         = 2049
  to_port           = 2049
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
  # Need to explicitly set the dependency on this resource
  depends_on = [
    aws_efs_mount_target.mount_target_subnet_one
  ]

  # AMI to use for the instance.
  ami                         = data.aws_ami.amz_linux.id
  # Whether to associate a public IP address with an instance in a VPC
  associate_public_ip_address = true
  # AZ to start the instance in.
  # availability_zone           = data.aws_availability_zones.availability_zones.names[0]
  # If true, enables EC2 Instance Termination Protection (defaults to false)
  disable_api_termination     = false 
  #  If true, the launched EC2 instance will support hibernation
  hibernation                 = var.hibernate
  # The instance type to use for the instance
  instance_type               = "t3.micro"
  # Key name of the Key Pair to use for the instance
  key_name                    = var.ssh_key
  # VPC Subnet ID to launch in.
  subnet_id                   = data.aws_subnet.zone_one.id
  #  User data to provide when launching the instance
  user_data_base64            = base64encode(local.user_data_01) 
  #  A list of security group IDs to associate with
  vpc_security_group_ids      = [ aws_security_group.cotb_dev_web_sg.id ]

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

resource "aws_instance" "cotb_dev_web_02" {
  depends_on = [
    aws_efs_mount_target.mount_target_subnet_two
  ]

  # AMI to use for the instance.
  ami                         = data.aws_ami.amz_linux.id
  # Whether to associate a public IP address with an instance in a VPC
  associate_public_ip_address = true
  # AZ to start the instance in.
  # availability_zone           = data.aws_availability_zones.availability_zones.names[0]
  # If true, enables EC2 Instance Termination Protection (defaults to false)
  disable_api_termination     = false 
  #  If true, the launched EC2 instance will support hibernation
  hibernation                 = var.hibernate
  # The instance type to use for the instance
  instance_type               = "t3.micro"
  # Key name of the Key Pair to use for the instance
  key_name                    = var.ssh_key
  # VPC Subnet ID to launch in.
  subnet_id                   = data.aws_subnet.zone_two.id
  #  User data to provide when launching the instance
  user_data_base64            = base64encode(local.user_data_02) 
  #  A list of security group IDs to associate with
  vpc_security_group_ids      = [ aws_security_group.cotb_dev_web_sg.id ]

  root_block_device {
    # Whether the volume should be destroyed on instance termination
    # Defaults to true for the root volume
    delete_on_termination = true
    # Size of the volume in gibibytes
    volume_size = "8"
  }

  tags = {
    Name = "cotb-dev-web-02"
  }
}

output "instances" {
  value = {
    instance_one = aws_instance.cotb_dev_web_01.public_ip
    instance_two = aws_instance.cotb_dev_web_02.public_ip
  }
}
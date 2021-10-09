locals {
  user_data_euw2 = <<EOF
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
    <h1>nginx is running in eu-west-2</h1>
  </body>
</html>
DOC
EOF
}

data "aws_ami" "amz_linux_euw2" {
  provider  = aws.euwest2

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

# Get the default VPCs
data "aws_vpc" "default_euwest2" {
  provider  = aws.euwest2
  default   = true
}

resource "aws_security_group" "cotb_dev_web_sg_euw2" {
  provider  = aws.euwest2
  name      = "cotb-dev-web-sg"
  vpc_id    = data.aws_vpc.default_euwest2.id
}

# Create an inbound rule allowing HTTP traffic
resource "aws_security_group_rule" "allow_http_in_euw2" {
  provider          = aws.euwest2
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_web_sg_euw2.id
}

# create an outbound rule allowing all traffic
resource "aws_security_group_rule" "allow_all_out_euw2" {
  provider          = aws.euwest2
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_web_sg_euw2.id
}

resource "aws_instance" "cotb_dev_web_euw2" {
  provider                    = aws.euwest2
  # AMI to use for the instance.
  ami                         = data.aws_ami.amz_linux_euw2.id
  # Whether to associate a public IP address with an instance in a VPC
  associate_public_ip_address = true
  # If true, enables EC2 Instance Termination Protection (defaults to false)
  disable_api_termination     = false
  # The instance type to use for the instance
  instance_type               = "t3.micro"
  #  User data to provide when launching the instance
  user_data_base64            = base64encode(local.user_data_euw2) 
  #  A list of security group IDs to associate with
  vpc_security_group_ids = [ aws_security_group.cotb_dev_web_sg_euw2.id ]

  root_block_device {
    # Whether the volume should be destroyed on instance termination
    # Defaults to true for the root volume
    delete_on_termination = true
    # Size of the volume in gibibytes
    volume_size = "8"
  }

  tags = {
    Name = "cotb-dev-web-euw2"
  }
}
# Create a security in the default VPC
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "cotb_dev_web_sg" {
  # Name of the security group
  name = "cotb-dev-web-sg"
  # VPC ID
  vpc_id = aws_vpc.cotb_dev_vpc.id

  tags = {
    "Name" = "cotb-dev-web-sg"
  }
}

# Create an inbound rule allowing SSH traffic
resource "aws_security_group_rule" "allow_ssh_in_web" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_web_sg.id
}

# Create an inbound rule allowing HTTP traffic
resource "aws_security_group_rule" "allow_http_in_web" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_web_sg.id
}

# create an outbound rule allowing all traffic
resource "aws_security_group_rule" "allow_all_out_web" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_web_sg.id
}

# Create a security in the default VPC
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "cotb_dev_db_sg" {
  # Name of the security group
  name = "cotb-dev-db-sg"
  # VPC ID
  vpc_id = aws_vpc.cotb_dev_vpc.id

  tags = {
    "Name" = "cotb-dev-db-sg"
  }
}

# Create an inbound rule allowing SSH traffic
resource "aws_security_group_rule" "allow_ssh_in_db" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["10.0.2.0/24"]
  security_group_id = aws_security_group.cotb_dev_db_sg.id
}

# Create an inbound rule allowing HTTP traffic
resource "aws_security_group_rule" "allow_http_in_db" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["10.0.2.0/24"]
  security_group_id = aws_security_group.cotb_dev_db_sg.id
}

# Create an inbound rule allowing HTTP traffic
resource "aws_security_group_rule" "allow_ping_in_db" {
  type              = "ingress"
  from_port         = 8
  to_port           = 0
  protocol          = "ICMP"
  cidr_blocks       = ["10.0.2.0/24"]
  security_group_id = aws_security_group.cotb_dev_db_sg.id
}

# create an outbound rule allowing all traffic
resource "aws_security_group_rule" "allow_all_out_db" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_db_sg.id
}
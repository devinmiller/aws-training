# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "cotb_dev_sg" {
  # Name of the security group
  name = "cotb-cluster-public-sg"
  # VPC ID
  vpc_id = aws_vpc.cotb_dev_vpc.id

  tags = {
    "Name" = "cotb-cluster-public-sg"
  }
}

# Create an inbound rule allowing SSH traffic
resource "aws_security_group_rule" "allow_ssh_in" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_sg.id
}

# Create an inbound rule allowing HTTP traffic
resource "aws_security_group_rule" "allow_http_in" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_sg.id
}

# Create an inbound rule allowing HTTPS traffic
resource "aws_security_group_rule" "allow_https_in" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_sg.id
}

# create an outbound rule allowing all traffic
resource "aws_security_group_rule" "allow_all_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_sg.id
}
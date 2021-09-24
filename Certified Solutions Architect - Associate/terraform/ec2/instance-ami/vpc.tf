# Get the default VPC
data "aws_vpc" "default" {
  provider = aws.east

  default = true
}

# Create a security in the default VPC
resource "aws_security_group" "cotb_dev_web_sg" {
  provider = aws.east

  name = "cotb-dev-web-sg"
  vpc_id = data.aws_vpc.default.id
}

# Create an inbound rule allowing SSH traffic
resource "aws_security_group_rule" "allow_ssh_in" {
  provider = aws.east

  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_web_sg.id
}

# Create an inbound rule allowing HTTP traffic
resource "aws_security_group_rule" "allow_http_in" {
  provider = aws.east

  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_web_sg.id
}

# create an outbound rule allowing all traffic
resource "aws_security_group_rule" "allow_all_out" {
  provider = aws.east
  
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cotb_dev_web_sg.id
}
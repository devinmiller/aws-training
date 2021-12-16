# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "cotb_dev_lab_route_table" {
  # The VPC ID
  vpc_id = aws_vpc.cotb_dev_lab_vpc.id

  tags = {
    Name = "cotb-dev-lab-route-table"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "subnet_route_table" {
  count = 3
  
  # The subnet ID to create an association
  subnet_id      = aws_subnet.cotb_dev_lab_subnets[count.index].id
  # The ID of the routing table to associate with
  route_table_id = aws_route_table.cotb_dev_lab_route_table.id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route
resource "aws_route" "cotb_dev_route_public_ipv4_out" {
  # The ID of the routing table
  route_table_id          = aws_route_table.cotb_dev_lab_route_table.id
  # The destination CIDR block.
  destination_cidr_block  = "0.0.0.0/0"
  #  Identifier of a VPC internet gateway or a virtual private gateway
  gateway_id              = aws_internet_gateway.cotb_dev_lab_igw.id
}
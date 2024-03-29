# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "cotb_cluster_public_route_table" {
  # The VPC ID
  vpc_id = aws_vpc.cotb_cluster_vpc.id

  tags = {
    Name = "cotb-cluster-public-route-table"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "public_subnet_route_table" {
  count = 3
  
  # The subnet ID to create an association
  subnet_id      = aws_subnet.cotb_cluster_public_subnets[count.index].id
  # The ID of the routing table to associate with
  route_table_id = aws_route_table.cotb_cluster_public_route_table.id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route
resource "aws_route" "cotb_cluster_route_public_ipv4_out" {
  # The ID of the routing table
  route_table_id          = aws_route_table.cotb_cluster_public_route_table.id
  # The destination CIDR block.
  destination_cidr_block  = "0.0.0.0/0"
  #  Identifier of a VPC internet gateway or a virtual private gateway
  gateway_id              = aws_internet_gateway.cotb_cluster_igw.id
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route
resource "aws_route" "cotb_cluster_route_public_ipv6_out" {
  # The ID of the routing table
  route_table_id          = aws_route_table.cotb_cluster_public_route_table.id
  # The destination IPv6 CIDR block.
  destination_ipv6_cidr_block  = "::/0"
  #  Identifier of a VPC internet gateway or a virtual private gateway
  gateway_id              = aws_internet_gateway.cotb_cluster_igw.id
}
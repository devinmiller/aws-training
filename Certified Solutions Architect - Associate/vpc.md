# Virtual Private Cloud (VPC)

Amazon Virtual Private Cloud (Amazon VPC) enables you to launch AWS resources into a virtual network that you've defined. This virtual network closely resembles a traditional network that you'd operate in your own data center, with the benefits of using the scalable infrastructure of AWS. 

## Features

The following are the key concepts for VPCs:

- Virtual private cloud (VPC)
  - A virtual network dedicated to your AWS account. 
- Subnet
  -  A range of IP addresses in your VPC. 
- Route table
  - A set of rules, called routes, that are used to determine where network traffic is directed. 
- Internet gateway
  - A gateway that you attach to your VPC to enable communication between resources in your VPC and the internet. 
- VPC endpoint
  - Enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by PrivateLink without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect connection.
- CIDR block
  - Classless Inter-Domain Routing. An internet protocol address allocation and route aggregation methodology.

## Exam Tips

- VPC
  - Think of a VPC as a logical datacenter in AWS
  - Consists of the follow:
    - Internet Gateways (or Virtual Private Gateways)
    - Route Tables
    - Network Access Control Lists
    - Subnets
    - Security Groups
  - 1 Subnet = 1 Availability Zone
  - Security Groups are Stateful
  - Network Access Control Lists are Stateless
  - **NO TRANSITIVE PEERING**
- Custom VPC
  - Amazon always reserves 5 IP addresses with each subnet
  - There can only be 1 internet gateway per VPC
  - Security Groups can't span VPCs
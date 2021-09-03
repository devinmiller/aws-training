# Elastic Cloud Compute (EC2)

Amazon Elastic Compute Cloud (Amazon EC2) provides scalable computing capacity in the Amazon Web Services (AWS) Cloud. Using Amazon EC2 eliminates your need to invest in hardware up front, so you can develop and deploy applications faster. You can use Amazon EC2 to launch as many or as few virtual servers as you need, configure security and networking, and manage storage. Amazon EC2 enables you to scale up or down to handle changes in requirements or spikes in popularity, reducing your need to forecast traffic. 

## Features

Amazon EC2 provides the following features:

- Virtual computing environments, known as _instances_
- Preconfigured templates for your instances, known as _Amazon Machine Images (AMIs)_ 
- Various configurations of CPU, memory, storage, and networking capacity, known as _instance types_
- Secure login information for your instances using _key pairs_
- Storage volumes for temporary data, known as _instance store volumes_
- Persistent storage volumes, known as _Amazon EBS volumes_
- Multiple physical locations for your resources, known as _Regions_ and _Availability Zones_
- A firewall for your instances using _security groups_
- Static IPv4 addresses for dynamic cloud computing, known as _Elastic IP addresses_
- Metadata, known as _tags_, that you can create and assign to your Amazon EC2 resources
- Virtual networks you can create known as _virtual private clouds (VPCs)_

[What is Amazon EC2?](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)

## Pricing

Amazon EC2 provides the following purchasing options to enable you to optimize your costs based on your needs: 

<details>
  <summary>On-Demand Instances</summary> 
  
  ---
  > Pay, by the second or hour, for the instances that you launch with no long term commitments. 
  >
  > You pay only for the seconds that your On-Demand Instances are in the running state.
  ---

  [On-Demand Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-on-demand-instances.html)
</details>

<details>
  <summary>Reserved Instances</summary>

  --- 
  > Reduce costs by making a commitment to a consistent instance configuration for a term of 1 or 3 years. 
  ---
  Types of Reserved Instances:

  > _Standard_
  >
  > Provides a more signifiant discount the more you pay up front and the longer the contract, but instances cannot be exchanged.

  > _Convertible_
  >
  > Provides less of a discount than _Standard_, but instances can exchanged (converted from one configuration to another).
    
  > _Scheduled_
  > 
  > Reserves capacity that is scheduled to recur daily, weekly, or monthly, with a specified start time and duration, for a one-year term
  ---
  Payment Types:

  > _All Upfront_
  >
  > Full payment is made at the start of the term, with no other costs or additional hourly charges.
  >
  > _Partial Upfront_
  >
  > A portion of the cost is paid upfront with the remaining hours billed at a discounted hourly rate regardless of instance usage.
  >
  > _No Upfront_
  >
  > The cost is billed at a discounted hourly rate for every hour in the term, regardless of instance usage.

  [Reserved Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-reserved-instances.html)
</details>

<details>
  <summary>Spot Instances</summary>

  ---
  > Uses spare EC2 capacity that is available for less than the On-Demand price.
  >
  > Spot Instances are a cost-effective choice if you can be flexible about when your applications run and if your applications can be interrupted.
  ---

  [Spot Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html)
</details>

<details>
  <summary>Dedicated Hosts</summary>
  
  ---
  > An Amazon EC2 Dedicated Host is a physical server with EC2 instance capacity fully dedicated to your use. Dedicated Hosts allow you to use your existing per-socket, per-core, or per-VM software licenses
  ---

  [Dedicated Hosts](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html)
</details>

### Security Groups

A security group acts as a virtual firewall for your instance to control inbound and outbound traffic. When you launch an instance in a VPC, you can assign up to five security groups to the instance. Security groups act at the instance level, not the subnet level. Therefore, each instance in a subnet in your VPC can be assigned to a different set of security groups. 

[Security Group Basics](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html)

The following are the characteristics of security groups:

- You can specify allow rules, but not deny rules
- You can specify separate rules for inbound and outbound traffic
- Security group rules enable you to filter traffic based on protocols and port numbers
- Security groups are stateful — if you send a request from your instance, the response traffic for that request is allowed to flow in regardless of inbound security group rules. Responses to allowed inbound traffic are allowed to flow out, regardless of outbound rules
- When you first create a security group, it has no inbound rules. Therefore, no inbound traffic originating from another host to your instance is allowed until you add inbound rules to the security group
- By default, a security group includes an outbound rule that allows all outbound traffic. You can remove the rule and add outbound rules that allow specific outbound traffic only. If your security group has no outbound rules, no outbound traffic originating from your instance is allowed
- Instances associated with a security group can't talk to each other unless you add rules allowing the traffic (exception: the default security group has these rules by default)
- A security group can only be used in the VPC that you specify when you create the security group

## Exam Tips

- EC2
  - Know the different EC2 instance types
  - Termination protection is turned off by default
  - For EBS backed instances that are terminated:
    - The default action is for the _root_ EBS volume to be terminated
    - The default action is for _non-root_ EBS volumes to be retained
  - The EBS _root_ volumes of default AMIs *can* be encrypted

- Security Groups
  - All _inbound_ traffic is blocked by default
  - All _outbound_ traffic is allowed
  - Changes to security groups take effect _immediately_
  - You can have any number of EC2 instances within a security group
  - You can have multiple security groups attached to EC2 instances
  - Security Groups are **stateful**
    -Do not have to configure both _inbound_ **and** _outbound_ ports
    - If an _inbound_ rule allows traffic in, the traffic is automatically allowed back out.
  - You cannot block specific IP addresses using Security Groups
    - Instead use Network Access Control Lists
  - You can specify allow rules, but not deny rules
    - Everything is denied by default
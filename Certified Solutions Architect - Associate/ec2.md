# Elastic Cloud Compute (EC2)

Amazon Elastic Compute Cloud (Amazon EC2) provides scalable computing capacity in the Amazon Web Services (AWS) Cloud. Using Amazon EC2 eliminates your need to invest in hardware up front, so you can develop and deploy applications faster. You can use Amazon EC2 to launch as many or as few virtual servers as you need, configure security and networking, and manage storage. Amazon EC2 enables you to scale up or down to handle changes in requirements or spikes in popularity, reducing your need to forecast traffic. 

## Features

Amazon EC2 provides the following features:

- Virtual computing environments, known as instances
- Preconfigured templates for your instances, known as _Amazon Machine Images (AMIs)_, that package the bits you need for your server (including the operating system and additional software) 
- Various configurations of CPU, memory, storage, and networking capacity for your instances, known as _instance types_
- Secure login information for your instances using _key pairs_ (AWS stores the public key, and you store the private key in a secure place)
- Storage volumes for temporary data that's deleted when you stop, hibernate, or terminate your instance, known as _instance store volumes_
- Persistent storage volumes for your data using Amazon Elastic Block Store (Amazon EBS), known as _Amazon EBS volumes_
- Multiple physical locations for your resources, such as instances and Amazon EBS volumes, known as _Regions_ and _Availability Zones_
- A firewall that enables you to specify the protocols, ports, and source IP ranges that can reach your instances using _security groups_
- Static IPv4 addresses for dynamic cloud computing, known as _Elastic IP addresses_
- Metadata, known as _tags_, that you can create and assign to your Amazon EC2 resources
- Virtual networks you can create that are logically isolated from the rest of the AWS Cloud, and that you can optionally connect to your own network, known as _virtual private clouds (VPCs)_

[What is Amazon EC2?](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)

## Pricing

Amazon EC2 provides the following purchasing options to enable you to optimize your costs based on your needs: 

<details>
  <summary>On-Demand Instances</summary> 
  
  ---
  > Pay, by the second or hour, for the instances that you launch. 
  >
  > Pay for compute capacity, by the second or hour, with no long-term commitments. You have full control over its lifecycle—you decide when to launch, stop, hibernate, start, reboot, or terminate it. 
  >
  > You pay only for the seconds that your On-Demand Instances are in the running state.
  ---

  [On-Demand Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-on-demand-instances.html)
</details>

<details>
  <summary>Reserved Instances</summary>

  --- 
  > Reduce costs by making a commitment to a consistent instance configuration for a term of 1 or 3 years. 
  >
  > Reserved Instances are a billing discount applied to the use of On-Demand Instances in your account that must match certain attributes.
  ---
  Types of Reserved Instances:

  > Standard
    : Provides a more signifiant discount the more you pay up front and the longer the contract, but instances cannot be exchanged.

  > Convertible
    : Provides less of a discount than _Standard_, but instances can exchanged (converted from one configuration to another).
    
  > Scheduled
    : Reserves capacity that is scheduled to recur daily, weekly, or monthly, with a specified start time and duration, for a one-year term
  ---

</details>

<details>
  <summary>Spot Instances</summary>

  ---
  > Uses spare EC2 capacity that is available for less than the On-Demand price.
  >
  > Spot Instances are a cost-effective choice if you can be flexible about when your applications run and if your applications can be interrupted.
  ---
</details>

<details>
  <summary>Dedicated Hosts</summary>
  
  ---
  > An Amazon EC2 Dedicated Host is a physical server with EC2 instance capacity fully dedicated to your use. Dedicated Hosts allow you to use your existing per-socket, per-core, or per-VM software licenses
  ---

</details>